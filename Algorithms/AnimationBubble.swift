//
//  AnimationBubble.swift
//  Algorithms
//
//  Created by Loc Tran on 3/21/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class AnimationBubble {
    
    var arrayAction: [Step]!
    var colSolution = 0
    var currentStep = Step()
    
    var arrayLabel: [SortingLabel]!
    var arrayLabelAbove: [SortingLabel]!
    var arrayLabelMiddle: [SortingLabel]!
    var arrayLabelBelow: [SortingLabel]!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(arrayLabel:[SortingLabel] , arrayLabelMiddle: [SortingLabel], arrayLabelAbove: [SortingLabel], arrayLabelBelow: [SortingLabel], arrayAction: [Step]){
        
        self.arrayAction = arrayAction
        self.arrayLabel = arrayLabel
        self.arrayLabelAbove = arrayLabelAbove
        self.arrayLabelBelow = arrayLabelBelow
        self.arrayLabelMiddle = arrayLabelMiddle
    }
    
    func animation() {
        
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 1, animations: {
            if (self.currentStep.act == "compare") {
                self.arrayLabel[self.currentStep.i].backgroundColor = COMPARE_COLOR
                self.arrayLabel[self.currentStep.j].backgroundColor = COMPARE_COLOR
                arrayViewTmp.text = "So sánh 2 số ở vị trí \(Int(self.currentStep.i+1)) và vị trí \(Int(self.currentStep.j+1))"

                self.arrayLabel[self.currentStep.i].alpha = 0.95
                self.arrayLabel[self.currentStep.j].alpha = 0.95
            }
            else
            {
                self.arrayLabel[self.currentStep.i].backgroundColor = SWAP_COLOR
                self.arrayLabel[self.currentStep.j].backgroundColor = SWAP_COLOR
                arrayViewTmp.text = " Giá trị số của vị trị thứ \(Int(self.currentStep.i+1)) nhỏ hơn số vị trí \(Int(self.currentStep.j+1))"

                self.arrayLabel[self.currentStep.i].alpha = 0.95
                self.arrayLabel[self.currentStep.j].alpha = 0.95
            }
        }){(finished) in
            if (self.currentStep.act == "compare") {
//                arrayViewTmp.text = " Giá trị số của vị trị thứ \(Int(self.currentStep.i+1)) Lớn hơn số vị trí \(Int(self.currentStep.j+1))"

                UIView.animate(withDuration: 1, animations: {
                    self.arrayLabel[self.currentStep.i].alpha = DEFAULT_ALPHA
                    self.arrayLabel[self.currentStep.j].alpha = DEFAULT_ALPHA
                }) {_ in
                    
                    self.arrayLabel[self.currentStep.i].backgroundColor = DEFAULT_COLOR
                    self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR
//                    arrayViewTmp.text = "Giữ Nguyên Vị Trí"

                    self.continueAnimation()
                }
            }
            else
            {
                UIView.animate(withDuration: 1, animations: {
                    self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelAbove[self.currentStep.i])
                    self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelBelow[self.currentStep.j])
                }){_ in
                    UIView.animate(withDuration: 1, animations: {
                        self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelAbove[self.currentStep.j])
                        self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelBelow[self.currentStep.i])
                    }){_ in
                        UIView.animate(withDuration: 1, animations: {
                            arrayViewTmp.text = "Chuyển 2 số vị trí \(Int(self.currentStep.i+1)) và vị trí \(Int(self.currentStep.j+1))"

                            self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelMiddle[self.currentStep.j])
                            self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelMiddle[self.currentStep.i])
                        }){_ in
                            self.arrayLabel[self.currentStep.i].backgroundColor = DEFAULT_COLOR
                            self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR
                            
                            self.arrayLabel[self.currentStep.i].alpha = DEFAULT_ALPHA
                            self.arrayLabel[self.currentStep.j].alpha = DEFAULT_ALPHA
                            
                            self.swapLabel(i: self.currentStep.i, j: self.currentStep.j)
                            
                            self.continueAnimation()
                        }
                    }
                }
            }
        }
    }
    
    func animationStep() {
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 0.5, animations: {
            if (self.currentStep.act == "compare") {
                self.arrayLabel[self.currentStep.i].backgroundColor = COMPARE_COLOR
                self.arrayLabel[self.currentStep.j].backgroundColor = COMPARE_COLOR
                arrayViewTmp.text = "So sánh 2 số ở vị trí \(Int(self.currentStep.i+1)) và vị trí \(Int(self.currentStep.j+1))"
                self.arrayLabel[self.currentStep.i].alpha = 0.95
                self.arrayLabel[self.currentStep.j].alpha = 0.95
            }
            else
            {
                
                self.arrayLabel[self.currentStep.i].backgroundColor = SWAP_COLOR
                self.arrayLabel[self.currentStep.j].backgroundColor = SWAP_COLOR
                arrayViewTmp.text = " Giá trị số của vị trị thứ \(Int(self.currentStep.i+1)) nhỏ hơn số vị trí \(Int(self.currentStep.j+1))"
                self.arrayLabel[self.currentStep.i].alpha = 0.95
                self.arrayLabel[self.currentStep.j].alpha = 0.95
            }
        }){(finished) in
            if (self.currentStep.act == "compare") {
                UIView.animate(withDuration: 0.5, animations: {
                    self.arrayLabel[self.currentStep.i].alpha = DEFAULT_ALPHA
                    self.arrayLabel[self.currentStep.j].alpha = DEFAULT_ALPHA
                }) {_ in
                    
                    self.arrayLabel[self.currentStep.i].backgroundColor = DEFAULT_COLOR
                    self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR
                    
                    self.continueAnimationStep()
                }
            }
            else{
                UIView.animate(withDuration: 0.5, animations: {
                    self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelAbove[self.currentStep.i])
                    self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelBelow[self.currentStep.j])
                    
                    print("we compare \(self.currentStep.i)")
                }){_ in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelAbove[self.currentStep.j])
                        self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelBelow[self.currentStep.i])
                    }){_ in
                        UIView.animate(withDuration: 0.5, animations: {
                            self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelMiddle[self.currentStep.j])
                            self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelMiddle[self.currentStep.i])
                        }){_ in
                            self.arrayLabel[self.currentStep.i].backgroundColor = DEFAULT_COLOR
                            self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR
                            
                            self.arrayLabel[self.currentStep.i].alpha = DEFAULT_ALPHA
                            self.arrayLabel[self.currentStep.j].alpha = DEFAULT_ALPHA
                            
                            self.swapLabel(i: self.currentStep.i, j: self.currentStep.j)
                            
//                            self.continueAnimation()
                            
                            self.continueAnimationStep()

                        }
                    }
                }
            }
        }
    }
    func animationBack() {

        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 0.5, animations: {
            if (self.currentStep.act == "compare") {
                self.arrayLabel[self.currentStep.i].backgroundColor = COMPARE_COLOR
                self.arrayLabel[self.currentStep.j].backgroundColor = COMPARE_COLOR

                self.arrayLabel[self.currentStep.i].alpha = 0.95
                self.arrayLabel[self.currentStep.j].alpha = 0.95
            }
            else
            {

                self.arrayLabel[self.currentStep.i].backgroundColor = SWAP_COLOR
                self.arrayLabel[self.currentStep.j].backgroundColor = SWAP_COLOR

                self.arrayLabel[self.currentStep.i].alpha = 0.95
                self.arrayLabel[self.currentStep.j].alpha = 0.95
            }
        }){(finished) in
            if (self.currentStep.act == "compare") {
                UIView.animate(withDuration: 0.5, animations: {
                    self.arrayLabel[self.currentStep.i].alpha = DEFAULT_ALPHA
                    self.arrayLabel[self.currentStep.j].alpha = DEFAULT_ALPHA
                }) {_ in

                    self.arrayLabel[self.currentStep.i].backgroundColor = DEFAULT_COLOR
                    self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR

                    self.continueAnimation()
                }
            }
            else
            {
                UIView.animate(withDuration: 0.3, animations: {
                    self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelAbove[self.currentStep.i])
                    self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelBelow[self.currentStep.j])
                }){_ in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelAbove[self.currentStep.j])
                        self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelBelow[self.currentStep.i])
                    }){_ in
                        UIView.animate(withDuration: 0.3, animations: {
                            self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelMiddle[self.currentStep.j])
                            self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelMiddle[self.currentStep.i])
                        }){_ in
                            self.arrayLabel[self.currentStep.i].backgroundColor = DEFAULT_COLOR
                            self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR

                            self.arrayLabel[self.currentStep.i].alpha = DEFAULT_ALPHA
                            self.arrayLabel[self.currentStep.j].alpha = DEFAULT_ALPHA

                            self.swapLabel(i: self.currentStep.i, j: self.currentStep.j)

                            self.continueAnimation()
                        }
                    }
                }
            }
        }
    }
    
    func swapLabel(i: Int, j: Int) {
        let temp = arrayLabel[i]
        arrayLabel[i] = arrayLabel[j]
        arrayLabel[j] = temp
    }

    func continueAnimation(){
        self.colSolution += 1
        
        if (self.colSolution == self.arrayAction.count) {
            return
        }
        self.currentStep = self.arrayAction[self.colSolution]
        self.animation()
    }
    
    func continueAnimationStep(){
        self.colSolution += 1
        
        if (self.colSolution == self.arrayAction.count) {
            btnStepTmp.isUserInteractionEnabled = true
            return
        }else{
            btnStepTmp.isUserInteractionEnabled = true

        }
        self.currentStep = self.arrayAction[self.colSolution]
    }
    
    func loop(){
        currentStep = self.arrayAction[self.colSolution]
        animation()
    }
    
    func next(){
        currentStep = self.arrayAction[self.colSolution]
        animationStep()
    }
    func back(){
        currentStep = self.arrayAction[self.colSolution-1]
        animationBack()

    }
    
    func moveLabel(from: SortingLabel, to: SortingLabel) {
        from.center = to.center
    }
}
