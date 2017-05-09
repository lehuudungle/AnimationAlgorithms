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
    
    var graph: GraphLinear!
    var viewcontroller: UIViewController!
    var arrayLabel: [SortingLabel]!
    
    var textStudy: DetailTxtView!
    var dictData = NSDictionary()
    var arrayKey = [String]()
    var ele = 0
    
    func initLinear(viewcontroller: UIViewController){
        
        graph = GraphLinear(frame: CGRect(x: 16, y: (viewcontroller.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height * 2, width: viewcontroller.view.bounds.size.width - CGFloat(32), height: viewcontroller.view.bounds.size.width - CGFloat(32)))
        viewcontroller.view.addSubview(graph)
    }
}
