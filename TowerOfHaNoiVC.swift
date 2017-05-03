//
//  TowerOfHaNoiVC.swift
//  Algorithms
//
//  Created by TTung on 5/3/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class TowerOfHaNoiVC: UIViewController {

    var manager: ManagerTower!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        manager = ManagerTower()
        manager.initSortWith(viewcontroller: self)
    }

}
