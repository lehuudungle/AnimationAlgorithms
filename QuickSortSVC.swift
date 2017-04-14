//
//  QuickSortVC.swift
//  Algorithms
//
//  Created by TTung on 3/28/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class QuickSortSVC: StudyVC {
    
    var managerSort: ManagerQuickSort!
    var btnStart:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.managerSort = ManagerQuickSort()
        self.managerSort.initSortWith(viewcontroller: self, arrayInput: [4,3,2,1,9,6])
        
        
        btnRun.addTarget(self.managerSort, action: #selector(ManagerQuickSort.run(sender:)), for: .touchUpInside)
        btnStep.addTarget(self.managerSort, action: #selector(managerSort.step(sender:)), for: .touchUpInside)
        btnReset.addTarget(self, action:  #selector(reset(sender:)), for: .touchUpInside)

        
    }
    
      func reset(sender:UIButton){
        self.managerSort.quickGraph.removeFromSuperview()
        btnRun.isUserInteractionEnabled = true
        btnStep.isUserInteractionEnabled = true
        managerSort.initSortWith(viewcontroller: self, arrayInput: [4,3,2,1,9,6])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

