//
//  LinearSVC.swift
//  Algorithms
//
//  Created by TTung on 5/8/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class LinearSVC: StudyVC {
  
    var search: Int!
    var manager: ManagerLinear!

    override func viewDidLoad() {
        super.viewDidLoad()
        manager = ManagerLinear()
        
        search = Int(arc4random_uniform(88)) + 11
        manager.initLinear(viewcontroller: self, search: search)
        btnRun.addTarget(self.manager, action: #selector(manager.run(sender:)), for: .touchUpInside)
    }
}
