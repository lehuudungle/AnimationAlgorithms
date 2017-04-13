//
//  MergeSortIVC.swift
//  Algorithms
//
//  Created by Loc Tran on 4/12/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class MergeSortIVC: InputVC{
    
    var count:Int!
    var managerSort: ManagerMergeSort!
    var arrayInput = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        count = 0
        self.managerSort = ManagerMergeSort()
        
        self.hideKeyboardWhenTappedAround()
        
        
        btnRun.addTarget(self, action: #selector(run(sender:)), for: .touchUpInside)
        
//        btnStep.addTarget(self.managerSort, action: #selector(managerSort.step(sender:)), for: .touchUpInside)
        
        btnReset.addTarget(self, action:  #selector(reset(sender:)), for: .touchUpInside)
        
        btnAdd.addTarget(self, action:  #selector(add(sender:)), for: .touchUpInside)
        btnRun1.addTarget(self.managerSort, action: #selector(managerSort.run(sender:)), for: .touchUpInside)
        btnRun.isUserInteractionEnabled = false
        
        btnRun1 = btnRun
    }
    
    func info(sender:UIButton){
        let vc = BubbleSortSVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func reset(sender:UIButton){
        self.managerSort.graph.removeFromSuperview()
        
        btnRun.setTitle("\u{f144}", for: .normal)
        btnRun.isUserInteractionEnabled = false
        btnStep.isUserInteractionEnabled = true
        
        count = 0
        
        self.arrayInput = []
        arrayView.text = ""
        btnAdd.isHidden = false
        textField.isHidden = false
        arrayView.isHidden = false
    }
    
    func run(sender:UIButton){
        
        if arrayInput.count > 1 {
            btnRun.isUserInteractionEnabled = true
            self.managerSort.initSortWith(viewcontroller: self, arrayInput: self.arrayInput)
            
            btnAdd.isHidden = true
            textField.isHidden = true
            arrayView.isHidden = true
        }else if(arrayInput.count == 1){
            print("count = 1")
            print(arrayInput.count)
        }else{
            self.managerSort.initSortWith(viewcontroller: self, arrayInput: [0,1])
            reset(sender: sender)
        }
        
    }
    
    func add(sender:UIButton){
        count = count + 1
        
        if(textField.text != "" && textField.text != nil){
            
            if (Int(textField.text!)! <= 99){
                
                if (arrayInput.count == 0 ){
                    arrayView.text = textField.text
                    arrayInput.append(Int(textField.text!)!)
                    if count > 1{
                        btnRun.isUserInteractionEnabled = true
                    }
                    
                }else if (arrayInput.count == 8){
                    btnAdd.isUserInteractionEnabled = false
                    
                }else {
                    arrayView.text = arrayView.text! + ", " + textField.text!
                    arrayInput.append(Int(textField.text!)!)
                    if count > 1{
                        btnRun.isUserInteractionEnabled = true
                    }
                }
            }else{
                btnAdd.isUserInteractionEnabled = false
            }
        }else{
            btnAdd.isUserInteractionEnabled = false
        }
        
        btnAdd.isUserInteractionEnabled = true
        textField.text = ""
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
