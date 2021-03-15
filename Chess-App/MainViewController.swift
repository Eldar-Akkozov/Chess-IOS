//
//  ViewController.swift
//  Chess-App
//
//  Created by Eldar on 12.03.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    private lazy var gameField: GameField = {
        let view = GameField()
        view.backgroundColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gameField)
        gameField.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(gameField.snp.width)
            make.centerY.equalToSuperview()
        }
    }
}

