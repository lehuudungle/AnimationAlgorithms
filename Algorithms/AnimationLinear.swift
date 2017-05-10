//
//  AnimationLinear.swift
//  Algorithms
//
//  Created by TTung on 5/9/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class AnimationLiear {
    
    var arrayLabel: [SortingLabel]!
    var linear: LinearSearch!
    var countSolution = 0
    var graph: GraphLinear!
    var currentStep = LinearStep()
    var arrayAction = [LinearStep]()
    
    init(arrayLabel:[SortingLabel] ,graph: GraphLinear, arrayAction: [LinearStep]){
        self.arrayLabel = arrayLabel
        self.graph = graph
        self.arrayAction = arrayAction
        print(arrayAction.count)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animation(){
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 1, animations: {
            if self.currentStep.act == "true"{
                self.arrayLabel[self.countSolution].alpha = 0.5
            self.arrayLabel[self.countSolution].backgroundColor = UIColor.green
            }
            else if self.currentStep.act == "false" {
                self.arrayLabel[self.countSolution].alpha = 0.5
                self.arrayLabel[self.countSolution].backgroundColor = UIColor.red
            }
        }) {_ in
            if self.countSolution == self.arrayAction.count - 1 {
                return
            }
                
            else if self.currentStep.act == "false" {
                
                self.countSolution = self.countSolution + 1
                
            }
            else if self.currentStep.act == "true" {
              
                return
        }
            self.currentStep = self.arrayAction[self.countSolution]
            self.animation()
        
        }
    }
    func loop(){
        self.currentStep = arrayAction[countSolution]
        animation()
    }
    
}
