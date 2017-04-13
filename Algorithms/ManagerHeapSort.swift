//
//  ManagerHeapSort.swift
//  Algorithms
//
//  Created by Loc Tran on 4/6/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class ManagerHeapSort {
    
    var animate: AnimationHeap!
    var viewcontroller: UIViewController!
    
    var arrayInput: [Int]!
    var arrayAction: [HeapStep]!
    var arrayDisplay: [Int]!
    var arrayColor: [UIColor]!
    
    var arrayLabel: [SortingLabel]!
    var arrayLabelBehind: [SortingLabel]!
    
    var arrayPosition: [SortingLabel]!
    
    var graph: HeapGraph!
    var sort: HeapSort!
    
    var btnStart: UIButton!
    
    
    func initSortWith(viewcontroller: UIViewController, arrayInput: [Int]) {
        
        self.viewcontroller = viewcontroller
        
        self.arrayInput = arrayInput
        self.arrayAction = getArrayAction(array: arrayInput)
        
        self.arrayDisplay = []
        self.arrayLabelBehind = []
        
        self.arrayColor = []
        
        for index in 0..<self.arrayInput.count {
            self.arrayDisplay.append(arrayInput[index])
            self.arrayColor.append(DEFAULT_COLOR)
        }
        
        graph = HeapGraph(frame: CGRect(x: 0, y: 100,
                                         width: viewcontroller.view.bounds.size.width,
                                         height: viewcontroller.view.bounds.size.height),
                           arrayDisplay: self.arrayDisplay,
                           colors: self.arrayColor)
        
        
        
        viewcontroller.view.addSubview(graph)
        
        
        self.arrayLabel = self.graph.arrayLabel
        self.arrayLabelBehind = self.graph.arrayLabelBehind
        self.arrayPosition = self.graph.arrayPosition
        
    }
    
    func getArrayAction(array: [Int]) -> [HeapStep] {
        
        sort = HeapSort(arrayInput: array)
        return sort.actionArray
        
    }
    
    @objc func run(sender: UIButton) {
        btnRun1.setTitle("\u{f28c}", for: .normal)
        
        animate = AnimationHeap(arrayLabel: self.arrayLabel,  arrayLabelBehind: self.arrayLabelBehind, arrayPosition: self.arrayPosition, arrayAction: self.arrayAction, graphHeap: graph)
        animate.loop()
        
    }

    
}
