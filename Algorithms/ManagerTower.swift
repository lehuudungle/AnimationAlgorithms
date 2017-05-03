//
//  ManagerTower.swift
//  Algorithms
//
//  Created by TTung on 5/3/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class ManagerTower {
    
    var graph: Graph_Tower!
    var viewcontroller: UIViewController!
    var tower: TowerOfHaNoi!
    var arrayAction: [TowerStep]!
    var animation: AnimationTower!
    var arrayCenter: [CGPoint]!
    var arrayLabel: [SortingLabel]!
   
    func initSortWith(viewcontroller: UIViewController) {
    
        
        graph = Graph_Tower(frame: CGRect(x: 0,
                                          y:(viewcontroller.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height * 2,
                                          width: viewcontroller.view.bounds.size.width,
                                          height: viewcontroller.view.bounds.size.height/2))
        viewcontroller.view.addSubview(graph)
        self.arrayAction = getArrayAction()
        self.arrayCenter = graph.bearingCenterPoint
        self.arrayLabel = graph.arrayLabel
        
        animation = AnimationTower(arrayLabel: arrayLabel, arrayCenter: arrayCenter, arrayAction: arrayAction)
        
    }
    
    func getArrayAction() -> [TowerStep]{
        tower = TowerOfHaNoi(disk: 3)
        return tower.arrayAction
    }
}
