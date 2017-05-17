//
//  DeapSVC.swift
//  Algorithms
//
//  Created by Ledung95d on 5/17/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
class DeapSVC: StudyVC{
    var manager: ManagerDeap!

    override func viewDidLoad() {
        super.viewDidLoad()
        manager = ManagerDeap()
        manager.initDeap(viewcontroller: self)
//        btnRun.addTarget(self.managerSort, action: #selector(managerSort.run(sender:)), for: .touchUpInside)

        btnStep.addTarget(self.manager, action: #selector(manager.step(sender:)), for: .touchUpInside)

//        btnReset.addTarget(self, action:  #selector(reset(sender:)), for: .touchUpInside)
    }
}
