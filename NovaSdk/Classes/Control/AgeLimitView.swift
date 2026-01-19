//
// Created by on 2025/10/28.
//

import Foundation

class AgeLimitView: UIView {

}


// 浮窗的状态
enum FloatingWindowStatus {
    case collapsed
    case expanded
}

// 浮窗的位置
enum FloatingWindowPlace {
    case left
    case right
}

class FloatingWindow: UIView {

    // 浮窗的大小
    private let windowSize = CGSize(width: 50, height: 50)
    // 记录触摸起始位置
    private var touchStartPoint: CGPoint = .zero
    // 记录浮窗起始位置
    private var windowStartFrame: CGRect = .zero

    private var windowStatus = FloatingWindowStatus.collapsed
    private var windowPlace = FloatingWindowPlace.left

    // 浮窗的图标
    private let iconView = UIImageView(image: UIImage.imageName(name: "logo_float"))
    private let iconSize = CGSize(width: 50, height: 50)
    private var iconFrame: CGRect = .zero

    private let contentView = UIImageView(image: UIImage.imageName(name: "float_content"))
    private var contentSize = CGSize(width: 128, height: 36)
    private var contentFrame: CGRect = .zero

    // 展开时的偏移值
    private let offset = CGSize(width: 115, height: -7)

    private let pointKey = "floating_window_point_key"

    private var floatPoint: CGPoint {
        set {
            kvStorage.set(key: pointKey, data: "\(newValue.x),\(newValue.y)")
        }
        get {
            let pointValue = kvStorage.get(key: pointKey)
            if pointValue.isEmpty {
                return .zero
            }
            let pointArray = pointValue.split(separator: ",")
            let x = Double(String(pointArray[0])) ?? 0
            let y = Double(String(pointArray[1])) ?? 0
            return CGPoint(x: x, y: y)
        }
    }

    // 便捷初始化
    convenience init(_ point: CGPoint) {
        let frame = CGRect(x: point.x, y: point.y, width: 50, height: 50)
        self.init(frame: frame)
        floatPoint = point
    }

    // 初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 设置浮窗外观
    private func setupView() {
        contentView.frame = CGRect(x: (iconSize.width - 13), y: 7, width: contentSize.width, height: contentSize.height)
        contentView.isUserInteractionEnabled = true
        contentView.isHidden = true
        addSubview(contentView)

        iconView.frame = CGRect(x: 0, y: 0, width: iconSize.width, height: iconSize.height)
        iconView.isUserInteractionEnabled = true
        addSubview(iconView)

        let safeAreaLeft = UIApplication.shared.keyWindow?.safeAreaInsets.left ?? 0
        windowPlace = floatPoint.x == safeAreaLeft ? .left : .right
        backgroundColor = .clear
        clipsToBounds = false
    }

    // 设置手势识别
    private func setupGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        // 设置点击手势优先级
        tapGesture.require(toFail: panGesture)

        addGestureRecognizer(panGesture)
        addGestureRecognizer(tapGesture)
    }

    // 处理拖动手势
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        if windowStatus == .expanded {
            return
        }

        layer.opacity = 1
        let screenBounds = UIScreen.main.bounds
        let translation = gesture.translation(in: superview)

        switch gesture.state {
        case .began:
            // 记录起始位置
            touchStartPoint = gesture.location(in: self)
            windowStartFrame = frame
            // 拖动时稍微放大一点，提升用户体验
            UIView.animate(withDuration: 0.2) {
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }

        case .changed:
            // 计算新位置
            var newX = windowStartFrame.origin.x + (translation.x)
            var newY = windowStartFrame.origin.y + (translation.y)

            // 限制在屏幕内
            newX = max(0, min(newX, screenBounds.width - windowSize.width))
            newY = max(0, min(newY, screenBounds.height - windowSize.height))

            frame = CGRect(x: newX, y: newY, width: windowSize.width, height: windowSize.height)

        case .ended, .cancelled:
            // 恢复原始大小
            UIView.animate(withDuration: 0.2) {
                self.transform = .identity
            }

            // 自动吸附到最近的边缘
            let screenWidth = screenBounds.width
            let centerX = frame.midX

            // 获取安全区域
            let safeAreaTop = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
            let safeAreaBottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            let safeAreaLeft = UIApplication.shared.keyWindow?.safeAreaInsets.left ?? 0
            let safeAreaRight = UIApplication.shared.keyWindow?.safeAreaInsets.right ?? 0

            // 计算应该吸附到左边还是右边
            let targetX: CGFloat = centerX < screenWidth / 2 ? safeAreaLeft : screenWidth - windowSize.width - safeAreaRight
            // 确保 Y 坐标在安全区域内
            let targetY = max(safeAreaTop, min(frame.origin.y, screenBounds.height - windowSize.height - safeAreaBottom))
            floatPoint = CGPoint(x: targetX, y: targetY)

            // 执行吸附动画
            UIView.animate(withDuration: 0.25, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5) { [weak self] in
                guard let self = self else {
                    return
                }
                self.frame.origin.x = targetX
                self.frame.origin.y = targetY
                self.frame.size = self.windowSize
                self.windowPlace = targetX == safeAreaLeft ? .left : .right
            }
            performAction()
        default:
            break
        }
    }

    func checkPoint() {
        // 获取屏幕边界
        let screenBounds = UIScreen.main.bounds

        // 获取安全区域
        let safeAreaTop = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        let safeAreaBottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        let safeAreaLeft = UIApplication.shared.keyWindow?.safeAreaInsets.left ?? 0
        let safeAreaRight = UIApplication.shared.keyWindow?.safeAreaInsets.right ?? 0


        // 确保当前frame在安全区域内
        var correctedFrame = frame

        // 限制X轴在屏幕范围内
        correctedFrame.origin.x = max(0, min(correctedFrame.origin.x, screenBounds.width - correctedFrame.width))

        // 限制Y轴在安全区域内
        correctedFrame.origin.y = max(safeAreaTop, min(correctedFrame.origin.y, screenBounds.height - correctedFrame.height - safeAreaBottom))

        // 如果位置有变化，则更新frame
        if correctedFrame != frame {
            frame = correctedFrame
            // 同时更新存储的位置信息
            floatPoint = CGPoint(x: correctedFrame.origin.x, y: correctedFrame.origin.y)
        }
    }

    // 处理点击事件
    @objc private func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        // 这里可以添加浮窗点击后的处理逻辑
        layer.opacity = 1
        if windowStatus == .expanded {
            collapsed()
        } else {
            expanded()
        }
    }

    @objc
    func performAction() {
        runInMain {
            NSObject.cancelPreviousPerformRequests(withTarget: self)
            self.perform(#selector(self.updateOpaque), with: nil, afterDelay: 2)
        }
    }

    @objc
    func updateOpaque() {
        layer.opacity = 0.5
        collapsed()
    }

    @objc
    func collapsed() {
        if windowStatus == .collapsed {
            return
        }

        // 执行收起动画
        UIView.animate(withDuration: 0.25, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5) { [weak self] in
            guard let self = self else {
                return
            }
            self.frame = windowStartFrame
            self.iconView.frame.origin.x = self.iconFrame.origin.x
            self.contentView.frame.origin.x = self.contentFrame.origin.x
            self.contentView.frame.size.width = 0
            self.windowStatus = .collapsed
            self.contentView.isHidden = true
        }
    }

    @objc
    func expanded() {
        if windowStatus == .expanded {
            return
        }

        // 保存当前位置和尺寸的副本，避免引用问题
        windowStartFrame = frame
        iconFrame = iconView.frame

        contentView.isHidden = false
        contentView.frame.size.width = 0

        // 放大
        let windowWidth = frame.size.width + offset.width
        let windowHeight = frame.size.height
        let windowX = (windowPlace == .left) ? windowStartFrame.origin.x : windowStartFrame.origin.x - offset.width

        let iconX = (windowPlace == .left) ? iconFrame.origin.x : iconFrame.origin.x + offset.width
        let contentX = (windowPlace == .left) ? (iconX + iconSize.width - 13) : 0

        // 执行展开动画
        UIView.animate(withDuration: 0.25, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5) { [weak self] in
            guard let self = self else {
                return
            }
            self.frame = CGRect(x: windowX, y: windowStartFrame.origin.y, width: windowWidth, height: windowHeight)
            self.iconView.frame.origin.x = iconX
            self.contentView.frame.origin.x = contentX
            self.contentView.frame.size.width = contentSize.width
            self.windowStatus = .expanded

            self.performAction()
        }
    }

}
