//
//  BreadthSVC.swift
//  Algorithms
//
//  Created by TTung on 5/15/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation

class BreadthSVC: StudyVC {
    
    var manager: ManagerBreadth!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = ManagerBreadth()
        manager.initBreadth(viewcontroller: self)
    }
}
