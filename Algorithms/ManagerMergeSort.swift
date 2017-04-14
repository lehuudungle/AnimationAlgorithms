//
//  ManagerSort.swift
//  Algorithms
//
//  Created by Loc Tran on 3/22/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class ManagerMergeSort {
    var animationStep: AnimationMerge!
    var animate: AnimationMerge!
    var viewcontroller: UIViewController!
    
    var arrayInput: [Int]!
    var arrayAction: [MergeStep]!
    var arrayDisplay: [Int]!
    var arrayColor: [UIColor]!
    
    var arrayLabel: [SortingLabel]!
    var arrayLabelOne: [SortingLabel]!
    var arrayLabelTwo: [SortingLabel]!
    var arrayLabelThree: [SortingLabel]!
    var arrayLabelFour: [SortingLabel]!
    
    var graph: MergeGraph!
    var sort: MergeSort!
    
    var ptu:Int!
    
    var btnStart: UIButton!
    
    
    func initSortWith(viewcontroller: UIViewController, arrayInput: [Int]) {
        
        self.viewcontroller = viewcontroller
        
        self.arrayInput = arrayInput
        self.arrayAction = getArrayAction(array: arrayInput)
        
        self.arrayDisplay = []
        self.arrayLabelOne = []
        self.arrayLabelTwo = []
        self.arrayLabelThree = []
        self.arrayLabelFour = []
        
        self.arrayColor = []
        if arrayInput.count%2 != 0  {
            ptu = arrayInput.count + 1
            
        }
        
        for index in 0..<self.arrayInput.count {
            self.arrayDisplay.append(arrayInput[index])
            self.arrayColor.append(SWAP_COLOR)
        }
        
        graph = MergeGraph(frame: CGRect(x: 0,
                                    y:(viewcontroller.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height * 2,
                                    width: viewcontroller.view.bounds.size.width,
                                    height: viewcontroller.view.bounds.size.height/2),
                      arrayDisplay: self.arrayDisplay,
                      colors: self.arrayColor)
        
        
        
        viewcontroller.view.addSubview(graph)
                

        self.arrayLabel = self.graph.arrayLabel
        self.arrayLabelOne = self.graph.arrayLabelOne
        self.arrayLabelTwo = self.graph.arrayLabelTwo
        self.arrayLabelThree = self.graph.arrayLabelThree
        self.arrayLabelFour = self.graph.arrayLabelFour
        
        animationStep = AnimationMerge(arrayLabel: self.arrayLabel, arrayLabelOne: self.arrayLabelOne, arrayLabelTwo: self.arrayLabelTwo, arrayLabelThree: self.arrayLabelThree, arrayLabelFour: self.arrayLabelFour, arrayAction: self.arrayAction, graphMerge: graph)
        
    }
    
    func getArrayAction(array: [Int]) -> [MergeStep] {
        
        sort = MergeSort(arrayInput: array)
        return sort.arrayElement
        
    }
    
    @objc func run(sender: UIButton) {
        
        animate = AnimationMerge(arrayLabel: self.arrayLabel, arrayLabelOne: self.arrayLabelOne, arrayLabelTwo: self.arrayLabelTwo, arrayLabelThree: self.arrayLabelThree, arrayLabelFour: self.arrayLabelFour, arrayAction: self.arrayAction, graphMerge: graph)
        animate.loop()
        
    }
    @objc func step(sender: UIButton) {
        btnStepTmp.isUserInteractionEnabled = false
        btnRunTmp.isUserInteractionEnabled = false
        
        animationStep.next()

    }
}
