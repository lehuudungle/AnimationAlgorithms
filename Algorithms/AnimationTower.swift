//
//  AnimationTower.swift
//  Algorithms
//
//  Created by TTung on 5/3/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
enum Tower: Int{
    case A = 1
    case B = 2
    case C = 3
}

class AnimationTower {
    
    var arrayAction: [TowerStep]!
    var arrayCenter: [CGPoint]!
    var arrayLabel: [SortingLabel]!
    var colSolution = 0
    var currentStep = TowerStep()
    var countA = 3
    var countB = 0
    var countC = 0

    
    init(arrayLabel:[SortingLabel] , arrayCenter: [CGPoint],  arrayAction: [TowerStep]){
        
        self.arrayAction = arrayAction
        self.arrayLabel = arrayLabel
        self.arrayCenter = arrayCenter
        self.currentStep = arrayAction[self.colSolution]
    }
    
    func animation(){
        
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 0.5, animations: {
            if self.currentStep.to == "C" {
                
            }
        }) {_ in
        
        }
    }
    func movelLabel(from: SortingLabel, to: Int, count: Int){
        
    }
}
