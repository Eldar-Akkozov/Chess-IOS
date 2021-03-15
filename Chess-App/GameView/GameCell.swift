//
//  GameFieldCell.swift
//  Chess-App
//
//  Created by Eldar on 14.03.2021.
//

import UIKit

class GameCell: BaseView {
    
    enum TypeCell {
        case black
        case white
        case `default`
    }
    
    private var types: TypeCell = .default
    
    var type: TypeCell {
        set {
            types = newValue
            
            switch newValue {
            case .black:
                backgroundColor = UIColor.init(hex: "#616065")
                break
            case .white:
                backgroundColor = UIColor.init(hex: "#a7a4a7")
                break
            case .default:
                backgroundColor = UIColor.init(hex: "#fdfafd")
                break
            }
        }
        get {
            return types
        }
    }
}
