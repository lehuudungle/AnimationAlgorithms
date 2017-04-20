//
//  ViewController.swift
//  Chess
//
//  Created by Tuuu on 3/8/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit
import AVFoundation
import KDPulseButton

class ViewController: UIViewController, UITextFieldDelegate {
  

    var gamemanager: GameManager!
    var mainViewSize = CGSize()
    var sizeBoard:UITextField!
    var spacing:CGFloat!
    var widthRatio = 3
    var btnSizeWidth:CGFloat!
    var btnSizeHeight:CGFloat!
    var x:CGFloat!
    var btn: UIButton!

    override func viewDidLoad() {
        
        spacing = view.bounds.size.width/CGFloat(widthRatio*3 + 4)
        btnSizeWidth = spacing*CGFloat(widthRatio)
        btnSizeHeight = btnSizeWidth*3/5
        x = 2*spacing + btnSizeWidth

        view.backgroundColor = UIColor(red: 245/255, green: 222/255, blue: 179/255, alpha: 1)
        super.viewDidLoad()
        self.gamemanager = GameManager()
        btnSizeBoard()
        self.gamemanager.initGameWith(viewcontroller: self, size: self.view.bounds.size.width)
        addSizeBoard()
        
        sizeBoard.delegate = self
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Find out what the text field will be after adding the current edit
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if Int(text) != nil {
            
            // Text field converted to an Int
            
            btn.isEnabled = true
        } else {
            // Text field is not an Int
            btn.isEnabled = false
        }
        
        // Return true so the text field will be changed
        return true
    }
    
    func addAlert(message: String){
        let alert = UIAlertController.init(title: "Warning",
                                           message: message,
                                           preferredStyle: .alert)
        
        let defaultAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func draw(sender: UIButton){
          if(sizeBoard.text != "" && sizeBoard.text != nil){
            if (Int(sizeBoard.text!)! <= 10){
                if (Int(sizeBoard.text!)! >= 4 ){
                    self.gamemanager.btnNext.isUserInteractionEnabled = true
                    self.gamemanager.boardView.removeFromSuperview()
                    self.gamemanager.btnStart.isHidden = true
                    self.gamemanager.lblSolutionFound.isHidden = true
                    self.gamemanager.rowTotal = Int(self.sizeBoard.text!)!
                    self.gamemanager.colTotal = Int(self.sizeBoard.text!)!
                    self.gamemanager.initGameWith(viewcontroller: self, size: self.view.bounds.size.width)
                }else{
                    
                addAlert(message: "Can not enter less than 10 digits")
                }
            }else{
                
                addAlert(message: "Can not enter more than 4 digits")
            }
        }
          else{
            addAlert(message: "Please enter a number")
        }
        sizeBoard.text = ""

       


    }
    
    func btnSizeBoard(){
        btn = KDPulseButton(frame: CGRect(x: 2*x-spacing, y: view.bounds.size.height-2*spacing-2*btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnSizeBoardTmp = btn
        btn.layer.backgroundColor = LIME_COLOR.cgColor
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.setTitle("\u{23CE}", for: .normal)
        btn.titleLabel?.font = UIFont.fontAwesome(ofSize: btn.fontoFitHeight())
        btn.setTitleColor(BUTTON_COLOR, for: .normal)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.numberOfLines = 0
        btn.titleLabel?.minimumScaleFactor = 0.2
        btn.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        btn.titleLabel?.baselineAdjustment = .alignCenters
        btn.titleLabel?.textAlignment = .center
        btn.layer.borderWidth = 2
        btn.layer.borderColor = BUTTON_COLOR.cgColor
        btn.layer.cornerRadius = 10

        btn.addTarget(self, action: #selector(draw(sender:)), for: .touchUpInside)
        view.addSubview(btn)
    }

    func addSizeBoard(){
        sizeBoard = UITextField(frame: CGRect(x: x, y: view.bounds.size.height-2*spacing-2*btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        textInPutBoard = sizeBoard
        sizeBoard.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        sizeBoard.textColor = UIColor.white
        sizeBoard.placeholder = "Size"
        view.addSubview(sizeBoard)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

