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
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawBoard(){
        let cellSize = self.frame.width/8
        for indexRow in 0..<8{
            for indexCol in 0..<8{
                
            }
        }
    }
}
