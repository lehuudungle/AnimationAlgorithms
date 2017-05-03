//
//  Graph_Tower.swift
//  Algorithms
//
//  Created by TTung on 5/3/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class Graph_Tower: UIView {
    var spacing : CGFloat!
    var bearingPoin: CGPoint!
    var rectSize: CGFloat!
    var arrayLabel: [SortingLabel]!
    var bearingCenterPoint: [CGPoint]!
    required init?(coder aDecoder: NSCoder) {
        fatalError(".....")
    }
    
        override init(frame: CGRect) {
        super.init(frame: frame)
             spacing = self.frame.width/16
             bearingPoin = CGPoint(x: spacing, y: self.frame.height*4/5)
             rectSize = spacing*4
            bearingCenterPoint = [CGPoint]()
            self.arrayLabel = [SortingLabel]()
            draw_Tower()
            drawPlate()
            self.backgroundColor  = UIColor.lightGray
    }
   
         func draw_Tower(){
                let line = CAShapeLayer()
        let linePath = UIBezierPath()
        var a = 3
        
            for i in 1...3 {
                linePath.move(to: CGPoint(x: bearingPoin.x*CGFloat(i) + rectSize*CGFloat(i-1), y: bearingPoin.y))
                linePath.addLine(to: CGPoint(x: bearingPoin.x*CGFloat(i) + rectSize*CGFloat(i), y: bearingPoin.y))
                linePath.move(to: CGPoint(x: bearingPoin.x*CGFloat(a), y: bearingPoin.y))
                linePath.addLine(to: CGPoint(x: bearingPoin.x*CGFloat(a), y: bearingPoin.y*2/5))
                bearingCenterPoint.append(CGPoint(x: bearingPoin.x*CGFloat(a), y: bearingPoin.y - (frame.height/20)))
                a = a + 5
            }
            line.path = linePath.cgPath
            line.lineWidth = 4
            line.strokeColor = UIColor.black.cgColor
            self.layer.addSublayer(line)
    }
    
    func drawPlate(){
        
        let colors: [UIColor] = [UIColor.blue, UIColor.orange, UIColor.green]
        for i in 0...2{
            let label = UILabel(frame: CGRect(x: spacing*1 + (spacing*0.5*CGFloat(i+1) - spacing*0.25), y: frame.height*CGFloat(7-i)/10, width: spacing*CGFloat(3-i) + spacing*0.5, height: frame.height/10))
            label.backgroundColor = colors[i]
            arrayLabel.append(label as! SortingLabel)
            self.addSubview(label)
        }
        arrayLabel.reverse()
        
    }
    
}
