//
//  BubbleSortIVC.swift
//  Algorithms
//
//  Created by Loc Tran on 4/10/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class BubbleSortIVC: InputVC{
    
    var MORE_THAN_ONE_ELE: Bool!
    var HAVE_GRAPH: Bool!
    var managerSort: ManagerBubbleSort!
    var arrayInput = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        MORE_THAN_ONE_ELE = false
        HAVE_GRAPH = false
        
        self.managerSort = ManagerBubbleSort()
        
        self.hideKeyboardWhenTappedAround()
        
        btnRun.addTarget(self, action: #selector(run(sender:)), for: .touchUpInside)
        
        btnStep.addTarget(self.managerSort, action: #selector(managerSort.step(sender:)), for: .touchUpInside)
        
        btnReset.addTarget(self, action:  #selector(reset(sender:)), for: .touchUpInside)
        
        btnAdd.addTarget(self, action:  #selector(add(sender:)), for: .touchUpInside)
        
    }
    
    func info(sender:UIButton){
        let vc = BubbleSortSVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func reset(sender:UIButton){
        
        print("reset")
        
        if HAVE_GRAPH == true{
            self.managerSort.graph.removeFromSuperview()
            HAVE_GRAPH = false
        }
        
        MORE_THAN_ONE_ELE = false
        
        btnRun.setTitle("\u{f144}", for: .normal)
        
        self.arrayInput = []
        arrayView.text = ""
        btnAdd.isHidden = false
        textField.isHidden = false
        arrayView.isHidden = false
    }
    
    func run(sender:UIButton){
        
        print("run")
        
        if MORE_THAN_ONE_ELE == true {
            
            print("true")
            self.managerSort.initSortWith(viewcontroller: self, arrayInput: self.arrayInput)
            
            HAVE_GRAPH = true
            
            btnAdd.isHidden = true
            textField.isHidden = true
            arrayView.isHidden = true
            
        }else {
            
            print("false")
            addAlert(message: "Please add more number")
        }
    }
    
    func add(sender:UIButton){
        
        if(textField.text != "" && textField.text != nil){
            if (Int(textField.text!)! <= 99){
                if (arrayInput.count == 0 ){
                    arrayView.text = textField.text
                    arrayInput.append(Int(textField.text!)!)
                    
                }else if (arrayInput.count == 9){
                    addAlert(message: "Array can contain only 9 numbers for better visualization")
                    
                }else {
                    
                    MORE_THAN_ONE_ELE = true
                    btnRun.addTarget(self.managerSort, action: #selector(managerSort.run(sender:)), for: .touchUpInside)
                    arrayView.text = arrayView.text! + ", " + textField.text!
                    arrayInput.append(Int(textField.text!)!)

                }
            }else{
                
                addAlert(message: "Cannot input 3-digit interger")
            }
        }else{
            addAlert(message: "Please enter a number")
//            btnAdd.isUserInteractionEnabled = false
        }
        
//        btnAdd.isUserInteractionEnabled = true
        textField.text = ""
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
