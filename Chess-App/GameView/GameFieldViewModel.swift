//
//  GameFieldViewModel.swift
//  Chess-App
//
//  Created by Eldar on 14.03.2021.
//

import Foundation
import UIKit

protocol GameFieldDelegate: class {
    func showCell(cells: [[GameCell]])
    func drawCell(x: Int, y: Int, cell: GameCell)
}

class GameFieldViewModel {
    
    private var cellsChangeType = true
    private var cellsChangeTypeLine = true
    
    static let numberOfCellsInWidth = 8
    static let numberOfCellsInHeight = 8
    
    private weak var delegate: GameFieldDelegate?
    
    private lazy var cells: [[GameCell]] = {
        return getCells()
    }()
    
    init(delegate: GameFieldDelegate) {
        self.delegate = delegate
    }
    
    func getCells() {
        delegate?.showCell(cells: cells)
    }
    
    func getDrawField() {
        for i in 0...(GameFieldViewModel.numberOfCellsInHeight - 1) {
            for j in 0...(GameFieldViewModel.numberOfCellsInWidth - 1) {
                delegate?.drawCell(x: j, y: i, cell: cells[i][j])
            }
        }
    }
    
    private func getCells() -> [[GameCell]] {
        var cells = [[GameCell]]()

        for _ in 0...(GameFieldViewModel.numberOfCellsInHeight - 1) {
            cells.append(getLine());
            
            if cellsChangeTypeLine {
                cellsChangeTypeLine = false
            } else {
                cellsChangeTypeLine = true
            }
        }
        
        return cells
    }
    
    private func getLine() -> [GameCell] {
        var cells = [GameCell]()
        
        for _ in 0...(GameFieldViewModel.numberOfCellsInWidth - 1) {
            if cellsChangeType {
                cellsChangeType = false
                let cell = GameCell()
                
                if cellsChangeTypeLine {
                    cell.type = .white
                } else {
                    cell.type = .black
                }
                
                cells.append(cell)
            } else {
                let cell = GameCell()
                
                if cellsChangeTypeLine {
                    cell.type = .black
                } else {
                    cell.type = .white
                }
                
                cellsChangeType = true
                cells.append(cell)
            }
        }
        
        return cells
    }
}
