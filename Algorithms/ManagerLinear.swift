//
//  ManagerLinear.swift
//  Algorithms
//
//  Created by TTung on 5/8/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class ManagerLinear {
    
    var animate: AnimationLiear!
    var graph: GraphLinear!
    var viewcontroller: UIViewController!
    var arrayLabel: [SortingLabel]!
    var arrayAction: [LinearStep]!
    var linear: LinearSearch!
    
    var textStudy: DetailTxtView!
    var dictData = NSDictionary()
    var arrayKey = [String]()
    var ele = 0
    var search: Int!
    
    func initLinear(viewcontroller: UIViewController, search: Int){
        
        
        graph = GraphLinear(frame: CGRect(x: 16, y: (viewcontroller.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height * 2, width: viewcontroller.view.bounds.size.width - CGFloat(32), height: viewcontroller.view.bounds.size.width - CGFloat(32)))
        viewcontroller.view.addSubview(graph)
        
        self.search = search
        self.arrayAction = getAction(arr: graph.arrayFind)
        print(arrayAction)
        print(search)
        animate = AnimationLiear(arrayLabel: graph.arrayLabel, graph: graph, arrayAction: arrayAction)
    }
    
    func getAction(arr: [Int]) -> [LinearStep] {
        linear = LinearSearch(arrayInput: arr, search: search)
        return linear.arrayAction
    }
    @objc func run(sender: UIButton){
        animate.loop()
    }
}
