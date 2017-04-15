//
//  ManagerSort.swift
//  Algorithms
//
//  Created by Loc Tran on 3/22/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit



class ManagerBubbleSort {
    
    
    var animate: AnimationBubble!
    var animateStep: AnimationBubble!
    var viewcontroller: UIViewController!
    
    var arrayInput: [Int]!
    var arrayAction: [Step]!
    var arrayDisplay: [Int]!
    var arrayColor: [UIColor]!
    
    var arrayLabel: [SortingLabel]!
    var arrayLabelAbove: [SortingLabel]!
    var arrayLabelMiddle: [SortingLabel]!
    var arrayLabelBelow: [SortingLabel]!
    
    var graph: Graph!
    var sort: BubbleSort!
    var count:Int!
    
    
    func initSortWith(viewcontroller: UIViewController, arrayInput: [Int]) {
        
        self.viewcontroller = viewcontroller
        
        self.arrayInput = arrayInput
        self.arrayAction = getArrayAction(array: arrayInput)
        
        self.arrayDisplay = []
        self.arrayLabelAbove = []
        self.arrayLabelMiddle = []
        self.arrayLabelBelow = []
        self.arrayColor = []
        count = 0
        
        for index in 0..<arrayInput.count {
            self.arrayDisplay.append(arrayInput[index])
            self.arrayColor.append(DEFAULT_COLOR)
        }
        
        graph = Graph(frame: CGRect(x: 0,
                                    y:(viewcontroller.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height * 2,
                                    width: viewcontroller.view.bounds.size.width,
                                    height: viewcontroller.view.bounds.size.height/2),
                      arrayDisplay: self.arrayDisplay,
                      colors: self.arrayColor)
        
        viewcontroller.view.addSubview(graph)
        
        
        
        self.arrayLabel = self.graph.arrayLabel
        self.arrayLabelMiddle = self.graph.arrayLabelMiddle
        self.arrayLabelBelow = self.graph.arrayLabelBelow
        self.arrayLabelAbove = self.graph.arrayLabelAbove
        
        animateStep = AnimationBubble(arrayLabel: self.arrayLabel, arrayLabelMiddle: self.arrayLabelMiddle, arrayLabelAbove: self.arrayLabelAbove, arrayLabelBelow: self.arrayLabelBelow, arrayAction: self.arrayAction)
        
    }
    
    func getArrayAction(array: [Int]) -> [Step] {
        
        sort = BubbleSort(arrayInput: array)
        return sort.arrayAction
        
    }
    
    @objc func run(sender: UIButton) {
        
        
        animate = AnimationBubble(arrayLabel: self.arrayLabel, arrayLabelMiddle: self.arrayLabelMiddle, arrayLabelAbove: self.arrayLabelAbove, arrayLabelBelow: self.arrayLabelBelow, arrayAction: self.arrayAction)
        

        btnRunTmp.isUserInteractionEnabled = false
        btnStepTmp.isUserInteractionEnabled = false

        animate.loop()
    }
    
    @objc func step(sender: UIButton) {
        if count == 0{
            arrayViewTmp.text = "Giới thiệu phần mở đầu"
            count = 1
        }
        else if count == 1{
            arrayViewTmp.text = "Giới thiệu tiếp"
            count = 2
        }else{
        
        btnStepTmp.isUserInteractionEnabled = false
        btnRunTmp.isUserInteractionEnabled = false
        animateStep.next()
        }
    }
    @objc func back(sender: UIButton) {

        btnStepTmp.isUserInteractionEnabled = false
        btnRunTmp.isUserInteractionEnabled = false
        animateStep.back()
    }
    
    
}
