//
//  BaseView.swift
//  Chess-App
//
//  Created by Eldar on 14.03.2021.
//

import UIKit

class BaseView: UIView {
    
    var isCreate = false
    
    override func layoutSubviews() {
        if !isCreate {
            isCreate = true
            
            viewDidLoad()
        }
    }
    
    func viewDidLoad() {
        
    }
}
