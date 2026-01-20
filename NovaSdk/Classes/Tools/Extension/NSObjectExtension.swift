//
//  Created on 2024/6/20.
//

import Foundation


protocol ApplyProtocol {
}

extension ApplyProtocol {
    func apply(closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: ApplyProtocol {
}

