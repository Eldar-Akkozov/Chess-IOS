//
//  GameField.swift
//  Chess-App
//
//  Created by Eldar on 14.03.2021.
//

import UIKit

class GameField: BaseView {
    
    private lazy var viewModel: GameFieldViewModel = {
        return GameFieldViewModel(delegate: self)
    }()
    
    private var heightToOneCell: Double?
    private var widthToOneCell: Double?

    override func viewDidLoad() {
        heightToOneCell = Double(self.frame.height) / Double(GameFieldViewModel.numberOfCellsInHeight)
        widthToOneCell = Double(self.frame.width) / Double(GameFieldViewModel.numberOfCellsInWidth)
                
        viewModel.getDrawField()
        viewModel.getCells()
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.onTouch))
        addGestureRecognizer(gesture)
        
        let swipe = UIPanGestureRecognizer(target: self, action: #selector(handleSwipes))
        addGestureRecognizer(swipe)
    }
    
    @objc func onTouch(sender: UITapGestureRecognizer) {
        
    }
    
    @objc func handleSwipes(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began {
            
        }
        
        if gestureRecognizer.state == .changed {
            let translation = gestureRecognizer.translation(in: self)
            
            print("\(translation.x) \(translation.y)")
        }
        
        if gestureRecognizer.state == .ended {
            let translation = gestureRecognizer.translation(in: self)
            
            print("\(translation.x) \(translation.y) test")
        }
    }
}

extension GameField: GameFieldDelegate {
    func drawCell(x: Int, y: Int, cell: GameCell) {
        self.addSubview(cell)
        
        cell.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Double(y) * (self.heightToOneCell ?? 0))
            make.left.equalToSuperview().offset(Double(x) * (self.widthToOneCell ?? 0))
            make.height.equalTo((self.heightToOneCell ?? 0))
            make.width.equalTo((self.widthToOneCell ?? 0))
        }
    }
    
    func showCell(cells: [[GameCell]]) {
        
    }
}

