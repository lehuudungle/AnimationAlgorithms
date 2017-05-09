//
//  LinearSVC.swift
//  Algorithms
//
//  Created by TTung on 5/8/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class LinearSVC: StudyVC {

    var manager: ManagerLinear!
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = ManagerLinear()
        manager.initLinear(viewcontroller: self)

    }


}
