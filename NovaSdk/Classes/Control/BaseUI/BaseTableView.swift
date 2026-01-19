//
//  Created on 2024/6/21.
//

import Foundation

var TABLEVIEW_CONTENT_MARGIN: CGFloat = 20

class BaseTableView: UITableView {

    static let cellReuseId = "Cell-\(NSDate().timeIntervalSince1970)"

    static func view(_ style: UITableView.Style) -> BaseTableView {
        let tableView = BaseTableView(frame: .zero, style: style)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .dynamicColor(gameTheme.mainViewBackgroundColor)
        if #available(iOS 12.0, *) {
            tableView.estimatedRowHeight = UITableView.automaticDimension
        } else {
            tableView.estimatedRowHeight = 44
        }
        tableView.estimatedSectionFooterHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    func reloadAsync(_ block: @escaping (_ promise: PromiseInterface?) -> Void) {
//        let promise = Promise(waitFor: nil)
//        block(promise)
//        promise.eventually { [self] in
//            reloadData()
//        }
//    }

    override func reloadData() {
        super.reloadData()
    }

    func register(_ cellClass: AnyClass?) {
        self.register(cellClass, forCellReuseIdentifier: BaseTableView.cellReuseId)
    }

    func setCornerBorder() {
        if isLandscape {
            setCornerRadius(cornerRadius: 5)
            setBorder(width: 1, color: .clear)
        }
    }

    /// cell
    public func setCornerRadiusForSectionCell(cell: UITableViewCell,
                                              indexPath: IndexPath,
                                              tableView: UITableView,
                                              needSetAlone: Bool = false,
                                              cellY: CGFloat = 0
    ) {
        if !isLandscape {
            return
        }
        let cornerRadius: CGFloat = 5.0
        let sectionCount = tableView.numberOfRows(inSection: indexPath.section)
        let shapeLayer = CAShapeLayer()
        cell.layer.mask = nil

        if needSetAlone {
            let bezierPath = UIBezierPath(
                    roundedRect: cell.bounds.insetBy(dx: 0.0, dy: cellY),
                    cornerRadius: cornerRadius
            )
            shapeLayer.path = bezierPath.cgPath
            cell.layer.mask = shapeLayer
        } else {
            if sectionCount > 1 {
                switch indexPath.row {
                case 0:
                    var bounds = cell.bounds
                    bounds.origin.y += 1.0
                    let bezierPath = UIBezierPath(roundedRect: bounds,
                            byRoundingCorners: [.topLeft, .topRight],
                            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
                    shapeLayer.path = bezierPath.cgPath
                    cell.layer.mask = shapeLayer
                case sectionCount - 1:
                    var bounds = cell.bounds
                    bounds.size.height -= 1.0
                    let bezierPath = UIBezierPath(roundedRect: bounds,
                            byRoundingCorners: [.bottomLeft, .bottomRight],
                            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
                    shapeLayer.path = bezierPath.cgPath
                    cell.layer.mask = shapeLayer
                default:
                    break
                }
            }
            else {
                let bezierPath = UIBezierPath(
                        roundedRect: cell.bounds.insetBy(dx: 0.0, dy: cellY),
                        cornerRadius: cornerRadius
                )
                shapeLayer.path = bezierPath.cgPath
                cell.layer.mask = shapeLayer
            }
        }
    }
}

extension UITableView {
    func dequeueReusableCell(_ indexPath: IndexPath) -> UITableViewCell {
        self.dequeueReusableCell(withIdentifier: BaseTableView.cellReuseId, for: indexPath)
    }
}

