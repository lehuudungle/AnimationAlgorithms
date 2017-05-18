//
//  ManagerBreadth.swift
//  Algorithms
//
//  Created by TTung on 5/15/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation

class ManagerBreadth {
    
    var graph: GraphBreadthDeap!
    var viewcontroller: UIViewController!
    var arrayLabel: [SortingLabel]!
    
    var textStudy: DetailTxtView!
    var dictData = NSDictionary()
    var arrayKeys = [String]()
    var ele = 0
    var arrayAction: [BFS_Step]!
    var sort: BreadthFirstSearch!
    
    func initBreadth(viewcontroller: UIViewController){
        
        graph = GraphBreadthDeap(frame: CGRect(x: 0,
                                               y:(viewcontroller.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height * 2,
                                               width: viewcontroller.view.bounds.size.width,
                                               height: viewcontroller.view.bounds.size.height/2))
        viewcontroller.view.addSubview(graph)
        self.arrayAction = self.getArrayAction()
        
    }
    func getArrayAction() -> [BFS_Step] {

        sort = BreadthFirstSearch()
        return sort.arrayAction
        
    }
}
