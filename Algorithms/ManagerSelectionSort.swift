//
//  ManagerSort.swift
//  Algorithms
//
//  Created by Loc Tran on 3/22/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class ManagerSelectionSort {
    
    var animate: AnimationSelection!
    var animateStep: AnimationSelection!
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
    var sort: SelectionSort!
    
    var textStudy: TextStudy!
    var dictData = NSDictionary()
    var arrayKeys = [String]()
    var ele: Int!


    
    func initSortWith(viewcontroller: UIViewController, arrayInput: [Int]) {
        
        self.viewcontroller = viewcontroller
        
        self.arrayInput = arrayInput
        self.arrayAction = getArrayAction(array: arrayInput)
        
        self.arrayDisplay = []
        self.arrayLabelAbove = []
        self.arrayLabelMiddle = []
        self.arrayLabelBelow = []
        
        self.arrayColor = []
        
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
        
        animateStep = AnimationSelection(arrayLabel: self.arrayLabel, arrayLabelMiddle: self.arrayLabelMiddle, arrayLabelAbove: self.arrayLabelAbove, arrayLabelBelow: self.arrayLabelBelow, arrayAction: self.arrayAction)
        
        
        if(VIEW_CHOSEN=="study"){
            ele = 0
            textStudy = TextStudy(frame: CGRect(x: graph.frame.origin.x, y: graph.frame.origin.y+graph.frame.height, width: graph.frame.width, height: yMax-(graph.frame.origin.y+graph.frame.height)))
            textStudy.backgroundColor = UIColor.yellow
            viewcontroller.view.addSubview(textStudy)

            textStudy.text = ""
            var path: String = ""
            path = Bundle.main.path(forResource:"SelectionSort", ofType: "plist")!
            dictData = NSDictionary(contentsOfFile: path)!
            arrayKeys = dictData.allKeys as! [String]
            arrayKeys = arrayKeys.sorted(by: {$0 < $1})
            print("sap xep : \(arrayKeys)")
        }
        
        
    }
    
    func getArrayAction(array: [Int]) -> [Step] {
        
        sort = SelectionSort(arrayInput: array)
        return sort.arrayAction
        
    }
    
    @objc func run(sender: UIButton) {
        
        animate = AnimationSelection(arrayLabel: self.arrayLabel, arrayLabelMiddle: self.arrayLabelMiddle, arrayLabelAbove: self.arrayLabelAbove, arrayLabelBelow: self.arrayLabelBelow, arrayAction: self.arrayAction)
               
        animate.loop()
    }
    
    @objc func step(sender: UIButton) {
        
        if(VIEW_CHOSEN=="study"){
            if(ele==arrayKeys.count){
                textStudy.text = ""
                return
            }
            btnRunTmp.isUserInteractionEnabled = false
            btnRunTmp.layer.backgroundColor = UIColor.gray.cgColor
            btnRunTmp.setNeedsDisplay()

            if(arrayKeys[ele].isNumber){
                btnStepTmp.isUserInteractionEnabled = false
                let data = dictData[arrayKeys[ele]]
                textStudy.text = data as! String?
                animateStep.next()
            }else if(arrayKeys[ele]=="end"){
                textStudy.text = "The list is fully sorted"
                btnStepTmp.layer.backgroundColor = UIColor.gray.cgColor
                btnStepTmp.setNeedsDisplay()
                btnStepTmp.isUserInteractionEnabled = false

            }else{
                let data = dictData[arrayKeys[ele]]
                textStudy.text = data as! String?

                btnStepTmp.isUserInteractionEnabled = true

            }
            ele = ele + 1

        }else{
            btnStepTmp.isUserInteractionEnabled = false
            btnRunTmp.isUserInteractionEnabled = false
            animateStep.next()
        }
    }
    
    

}
