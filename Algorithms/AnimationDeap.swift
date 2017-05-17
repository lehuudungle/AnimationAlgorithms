//
//  AnimationDeap.swift
//  Algorithms
//
//  Created by Ledung95d on 5/17/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit
class AnimationDeap{
    var graph: GraphBreadthDeap!
    var arrayAction: [DFS_Step]!
    var countSolution = 0
    var currentStep: DFS_Step!
    var arrayLabel:[SortingLabel]!
    var a: SortingLabel!
    var value: Int = -1
    init(graph: GraphBreadthDeap,arrayAction:[DFS_Step],arrayLabel: [SortingLabel]!) {
        self.graph = graph
        self.arrayAction = arrayAction
        self.arrayLabel = arrayLabel
        print(self.arrayAction)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func animation(){
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 1, animations: {
            print("current Step : \(self.currentStep.act)")
            switch self.currentStep.to{

            case "A":self.value = 1
                    self.setColorLabel(change: true)
                    break
            case "B":self.value = 4;
                self.setColorLabel(change: false)

                    break;
            case "C": self.value = 6;
                self.setColorLabel(change: false);

                    break;
            case "D":self.value = 2;
                self.setColorLabel(change: true);

                    break;
            case "E":
                self.value = 7;
                self.setColorLabel(change: false);

                    break;
            case "F":self.value = 3;
                self.setColorLabel(change: true);

                    break;
            case "G":self.value = 5;
            self.setColorLabel(change: false);

                    break;
            default: break
            }
            
        }){_ in
            self.countSolution += 1
            if(self.countSolution==self.arrayAction.count){
                return
            }
            self.resetColorLable(value: self.value)
            self.currentStep = self.arrayAction[self.countSolution]
            self.animation()

        }
    }
    func setColorLabel(change: Bool){
        print("set color")
        if(change){
            self.arrayLabel[value].text = "\u{f00d}"
            self.arrayLabel[value].font = UIFont.fontAwesome(ofSize: 12)
        }
        self.arrayLabel[value].layer.backgroundColor = UIColor.green.cgColor
        self.arrayLabel[value].layer.borderColor = UIColor.red.cgColor
        self.arrayLabel[value].layer.setNeedsDisplay()



    }
    func resetColorLable(value: Int){
        self.arrayLabel[value].layer.borderColor = UIColor.black.cgColor
    }
    func loop(){
        self.currentStep = arrayAction[countSolution]
        animation()
    }

}
