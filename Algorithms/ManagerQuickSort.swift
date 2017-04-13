//
//  ManagerQuickSort.swift
//  Algorithms
//
//  Created by Loc Tran on 3/22/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class ManagerQuickSort{
    
    var animate: AnimationQuick!
    var viewcontroller: UIViewController!
    
    var arrayInput: [Int]!
    var arrayAction: [QuickStep]!
    var arrayDisplay: [Int]!
    var arrayColor: [UIColor]!
    
    var arrayLabel: [SortingLabel]!
    var arrayLabelAbove: [SortingLabel]!
    var arrayLabelMiddle: [SortingLabel]!
    var arrayLabelMark: [SortingLabel]!
    
    var graph: Graph!
    var sort: QuickSort!
    var quickGraph: QuickGraph!
    
    
    func initSortWith(viewcontroller: UIViewController, arrayInput: [Int]) {
        
        self.viewcontroller = viewcontroller
        
        self.arrayInput = arrayInput
        self.arrayAction = getArrayAction(array: arrayInput)
        var  ele = 0
        for _ in self.arrayAction{
            ele  = ele + 1
        }
        
        
        self.arrayDisplay = []
        self.arrayLabelAbove = []
        self.arrayLabelMiddle = []
        self.arrayLabelMark = []
        
        self.arrayColor = []
        
        for index in 0..<arrayInput.count {
            self.arrayDisplay.append(arrayInput[index])
            self.arrayColor.append(DEFAULT_COLOR)
        }
        
        quickGraph = QuickGraph(frame: CGRect(x: 0, y: 250, width: viewcontroller.view.bounds.size.width, height: viewcontroller.view.bounds.size.height-100), arrayDisplay: self.arrayDisplay, colors: self.arrayColor)
        viewcontroller.view.addSubview(quickGraph)
        
        
        self.arrayLabel = self.quickGraph.arrayLabel
        self.arrayLabelMiddle = self.quickGraph.arrayLabelMiddle
        self.arrayLabelMark = self.quickGraph.arrayLabelMark
        self.arrayLabelAbove = self.quickGraph.arrayLabelAbove
        
    }
    
    func getArrayAction(array: [Int]) -> [QuickStep] {
        
        sort = QuickSort(arrayInput: array)
        
        return sort.actionArray
        
        
    }
    
    @objc func run(sender: UIButton) {
                
        animate = AnimationQuick(arrayLabel: self.arrayLabel, arrayLabelMiddle: self.arrayLabelMiddle, arrayLabelAbove: self.arrayLabelAbove, arrayLabelMark: self.arrayLabelMark, arrayAction: self.arrayAction, graph: self.quickGraph)
        animate.loop()
        
    }
}
