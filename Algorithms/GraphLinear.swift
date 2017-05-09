//
//  GraphLinear.swift
//  Algorithms
//
//  Created by TTung on 5/8/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class GraphLinear: UIView {

    var squares: [[SortingLabel]]!
    var rowTotal = 8
    var colTotal = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        drawBoard()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawBoard(){
        let cellSize = self.frame.width/8
        var arrayInt = [Int]()
        for i in 10..<100{
            var int: Int!
            int = i
            arrayInt.append(int)
        }
        var count:Int = 89
        for indexRow in 0..<8{
            for indexCol in 0..<8{
                
                let label = SortingLabel(frame: CGRect(x: CGFloat(indexRow) * cellSize,
                                                       y: CGFloat(indexCol) * cellSize,
                                                       width: cellSize, height: cellSize))
                
                
                let pos = Int(arc4random_uniform(UInt32(count)))
                label.text = String(arrayInt[pos])
                arrayInt.remove(at: pos)
                count = count - 1
                label.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
                label.textAlignment = .center
                label.layer.masksToBounds = true
                label.layer.borderWidth = 2
                label.layer.cornerRadius = 5
                label.layer.borderColor = UIColor.black.cgColor
                
                self.addSubview(label)
                
            }
        }
    }
}
