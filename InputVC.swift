//
//  ViewController.swift
//  Algorithms
//
//  Created by TTung on 4/5/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit
import Foundation
import KDPulseButton

class InputVC: UIViewController, UITextFieldDelegate {
    
    var spacing:CGFloat!
    var widthRatio = 3
    var btnSizeWidth:CGFloat!
    var btnSizeHeight:CGFloat!
    var x:CGFloat!
    var btnReset:UIButton!
    var btnInfo:UIButton!
    var btnStep:UIButton!
    var btnRun:UIButton!
    var btnAdd:UIButton!
    var textField:UITextField!
    var arrayView:UILabel!
    
    var y: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white

        spacing = view.bounds.size.width/CGFloat(widthRatio*3 + 4)
        btnSizeWidth = spacing*CGFloat(widthRatio)
        btnSizeHeight = btnSizeWidth*3/5
        y = view.bounds.size.height - spacing * 2 - btnSizeHeight
        yMax = y
        x = 2*spacing + btnSizeWidth
        
        addBtnReset()
        addBtnStep()
        addBtnRun()
        addBtnAdd()
        addTextField()
        addTextView()
        
//        btnAdd.isEnabled = true
        textField.delegate = self
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Find out what the text field will be after adding the current edit
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        print(text)
        
//        if Int(text) != nil {
//            
//            print("!= nil")
//            // Text field converted to an Int
//            
//            btnAdd.isEnabled = true
//        } else {
//            print("xoa")
//            // Text field is not an Int
//            btnAdd.isEnabled = false
//        }
        
        // Return true so the text field will be changed
        return true
    }
    
    func addBtnReset() {
        
        btnReset = KDPulseButton(frame: CGRect(x: spacing, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnReset.layer.backgroundColor = GREEN_COLOR.cgColor
        btnReset.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnReset.setTitle("\u{f021}", for: .normal)
        btnReset.titleLabel?.font = UIFont.fontAwesome(ofSize: btnReset.fontoFitHeight())
        btnReset.setTitleColor(BUTTON_COLOR, for: .normal)
        btnReset.titleLabel?.adjustsFontSizeToFitWidth = true
        btnReset.titleLabel?.numberOfLines = 0
        btnReset.titleLabel?.minimumScaleFactor = 0.2
        btnReset.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        btnReset.titleLabel?.baselineAdjustment = .alignCenters
        btnReset.titleLabel?.textAlignment = .center
        btnReset.layer.cornerRadius = 10
        
        view.addSubview(btnReset)
    }
    
    func addBtnStep() {
        
        btnStep = KDPulseButton(frame: CGRect(x: x, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnStep1 = btnStep
        btnStep.layer.backgroundColor = GREEN_COLOR.cgColor
        btnStep.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnStep.setTitle("\u{f051}", for: .normal)
        
        btnStep.titleLabel?.textColor = UIColor.white
        btnStep.titleLabel?.font = UIFont.fontAwesome(ofSize: btnStep.fontoFitHeight())
        btnStep.setTitleColor(BUTTON_COLOR, for: .normal)
        btnStep.titleLabel?.adjustsFontSizeToFitWidth = true
        btnStep.titleLabel?.numberOfLines = 0
        btnStep.titleLabel?.minimumScaleFactor = 0.2
        btnStep.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        
        btnStep.titleLabel?.baselineAdjustment = .alignCenters
        btnStep.titleLabel?.textAlignment = .center
        btnStep.layer.cornerRadius = 10
        
        view.addSubview(btnStep)
    }
    
    func addBtnRun() {
        
        btnRun = KDPulseButton(frame: CGRect(x: 2*x-spacing, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnRun1 = btnRun
        btnRun.layer.backgroundColor = GREEN_COLOR.cgColor
        btnRun.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnRun.setTitle("\u{f144}", for: .normal)
        btnRun.setTitleColor(BUTTON_COLOR, for: .normal)
        btnRun.titleLabel?.font = UIFont.fontAwesome(ofSize: btnRun.fontoFitHeight())
        btnRun.titleLabel?.adjustsFontSizeToFitWidth = true
        btnRun.titleLabel?.numberOfLines = 0
        btnRun.titleLabel?.minimumScaleFactor = 0.2
        btnRun.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        btnRun.titleLabel?.baselineAdjustment = .alignCenters
        btnRun.titleLabel?.textAlignment = .center
        btnRun.layer.cornerRadius = 10
        
        view.addSubview(btnRun)
    }
    
    func addBtnAdd() {
        btnAdd = KDPulseButton(frame: CGRect(x: view.bounds.size.width/2 + spacing/2, y: view.bounds.size.height/2, width: btnSizeWidth, height: btnSizeHeight))
        btnAdd.layer.backgroundColor = GREEN_COLOR.cgColor
        btnAdd.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnAdd.setTitle("\u{23CE}", for: .normal)
        btnAdd.setTitleColor(BUTTON_COLOR, for: .normal)
        btnAdd.titleLabel?.font = UIFont.fontAwesome(ofSize: btnAdd.fontoFitHeight())
        btnAdd.titleLabel?.adjustsFontSizeToFitWidth = true
        btnAdd.titleLabel?.numberOfLines = 0
        btnAdd.titleLabel?.minimumScaleFactor = 0.2
        btnAdd.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        btnAdd.titleLabel?.baselineAdjustment = .alignCenters
        btnAdd.titleLabel?.textAlignment = .center
        btnAdd.layer.cornerRadius = 10
        
        view.addSubview(btnAdd)
    }
    
    func addTextField(){
        textField = UITextField(frame: CGRect(x: view.bounds.size.width/2 - spacing/2 - btnSizeWidth, y: view.bounds.size.height/2, width: btnSizeWidth, height: btnSizeHeight))
        
        textField.placeholder = "Number"
        textField.clearsOnInsertion = true
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        textField.layer.cornerRadius = 10
        self.view.addSubview(textField)
    }
    
    func addTextView() {
        arrayView = UILabel(frame: CGRect(x: spacing, y: view.bounds.size.height/2 - spacing - btnSizeHeight, width: view.bounds.size.width - 2*spacing, height: btnSizeHeight))
        
        arrayView.layer.borderWidth = 2
        arrayView.layer.borderColor = UIColor.black.cgColor
        arrayView.layer.masksToBounds = true
        
        arrayView.font = UIFont.boldSystemFont(ofSize: 15)

        arrayView.backgroundColor = UIColor.white
        arrayView.textAlignment = .center
        arrayView.layer.cornerRadius = 10
        arrayView.numberOfLines = 0
        
        arrayView.text = textField.text!
        
        self.view.addSubview(arrayView)
        
    }
    
    func addAlert(message: String){
        let alert = UIAlertController.init(title: "Warning",
                                           message: message,
                                           preferredStyle: .alert)
        
        let defaultAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
