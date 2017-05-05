//
//  GraphStacks.swift
//  Algorithms
//
//  Created by TTung on 5/4/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class GraphStacks: UIView {

    var arrayLabel: [SortingLabel]!
    var bearingcenterPoint: [CGPoint]!
    var labelObject: SortingLabel!
    let line = CAShapeLayer()
    let linePath = UIBezierPath()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(".....")
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.arrayLabel = [SortingLabel]()
        self.bearingcenterPoint = [CGPoint]()
        
        xEndMove_Stacks = frame.width/3 + CGFloat(8)
        yEndMove_Stacks = frame.height/10
        
        drawFrame()
        drawLabel()
        
    }
    
    func drawFrame(){
        
        linePath.move(to: CGPoint(x: frame.width/3, y: frame.height-CGFloat(8)))
        linePath.addLine(to: CGPoint(x: frame.width/3, y: frame.height*2/5-CGFloat(8)))
        linePath.move(to: CGPoint(x: frame.width/3, y: frame.height-CGFloat(8)))
        linePath.addLine(to: CGPoint(x: frame.width*2/3, y: frame.height-CGFloat(8)))
        linePath.move(to: CGPoint(x: frame.width*2/3, y: frame.height-CGFloat(8)))
        linePath.addLine(to: CGPoint(x: frame.width*2/3, y: frame.height*2/5-CGFloat(8)))
        line.path = linePath.cgPath
        line.lineWidth = 6
        line.cornerRadius = 10
        line.strokeColor = UIColor.black.cgColor
        self.layer.addSublayer(line)
        
    }
    
    
    func drawLabel(){
    var labelColor: [UIColor] = [UIColor.green, UIColor.blue, UIColor.red, UIColor.yellow, UIColor.purple, UIColor.brown]
        let labelText: [String] = ["Green", "Blue", "Red", "Yellow", "Purple", "Brown"]
        
        for i in 0...4{
             labelObject = SortingLabel(frame: CGRect(x: frame.width/3 + CGFloat(8), y: frame.height*9/10 - (frame.height/10)*CGFloat(i) - CGFloat(12)*CGFloat(i+1) + CGFloat(4)*CGFloat(i), width: frame.width/3 - CGFloat(16), height: frame.height/10))
            labelObject.layer.masksToBounds = true
            labelObject.layer.cornerRadius = 10
            labelObject.backgroundColor = labelColor[i]
            labelObject.text = labelText[i]
            labelObject.textColor = UIColor.black
            arrayLabel.append(labelObject)
            self.addSubview(labelObject)
         // 4
        }
        
        labelObject.isHidden = true
       
        for i in (3...5).reversed(){
        let label = SortingLabel(frame: CGRect(x: -200, y: 0, width: frame.width/3 - CGFloat(16), height: frame.height/10))
        label.textColor = UIColor.black
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = labelColor[i]
        label.text = labelText[i]
        arrayLabel.append(label)
        self.addSubview(label)
            
        // 7
        }
        let labelMedial = SortingLabel(frame: CGRect(x: frame.width/3 + CGFloat(8), y: 0, width: frame.width/3 - CGFloat(16), height: frame.height/10))
        arrayLabel.append(labelMedial)
        self.addSubview(labelMedial)
        
        // 8
        
        let labelOut = SortingLabel(frame: CGRect(x: frame.width + CGFloat(20), y: 0, width: frame.width/3 - CGFloat(16), height: frame.height/10))
        arrayLabel.append(labelOut)
        self.addSubview(labelOut)
        
        // 9
        
        for i in 0...3 {
        let labelTop = SortingLabel(frame: CGRect(x:frame.width/10, y: yEndMove_Stacks*CGFloat(6+i)+CGFloat(12), width: 70, height: 30))
        arrayLabel.append(labelTop)
        self.addSubview(labelTop)
            
        // 13
        }
        
        let labelMadiaThird = SortingLabel(frame: CGRect(x: frame.width/3 + CGFloat(8), y: frame.height*9/10 - (frame.height/10)*CGFloat(2) - CGFloat(12)*CGFloat(3) + CGFloat(4)*CGFloat(2), width: frame.width/3 - CGFloat(16), height: frame.height/10))
        arrayLabel.append(labelMadiaThird)
        self.addSubview(labelMadiaThird)
    
        let labelMadiaFourth = SortingLabel(frame: CGRect(x: frame.width/3 + CGFloat(8), y: frame.height*9/10 - (frame.height/10)*CGFloat(3) - CGFloat(12)*CGFloat(4) + CGFloat(4)*CGFloat(3), width: frame.width/3 - CGFloat(16), height: frame.height/10))
        arrayLabel.append(labelMadiaFourth)
        self.addSubview(labelMadiaFourth)
    
    }
        
    
}
