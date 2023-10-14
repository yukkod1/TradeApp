//
//  Utills.swift
//  TradeApp
//
//  Created by Artem Cherkasov on 03/09/2023.
//

import UIKit
import SnapKit

extension UIScreen {
    enum DeviceSize {
        
        case small
        case medium
        case big
    }

    var deviceSize: DeviceSize {
        let w  = UIScreen.main.bounds.width
        let h  = UIScreen.main.bounds.height
        let screenHeight = max(w, h)
        switch screenHeight {
        
        case 620...812:
            return .small
        case 812...896:
            return .medium
        default:
            return .big
        }
    }

    func resolveConstant(small: ConstraintOffsetTarget,  medium: ConstraintOffsetTarget,  big: ConstraintOffsetTarget) -> ConstraintOffsetTarget {
        switch deviceSize {
       
        case .small:
            return small
        case .medium:
            return medium
        case .big:
            return big
        }
    }
}
