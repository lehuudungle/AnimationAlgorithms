//
//  ViewController.swift
//  Algorithms
//
//  Created by TTung on 4/5/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit
import KDPulseButton

class StudyVC: UIViewController {
    
    var spacing:CGFloat!
    var widthRatio = 3
    var btnSizeWidth:CGFloat!
    var btnSizeHeight:CGFloat!
    var x:CGFloat!
    var btnReset:UIButton!
    var btnInfo:UIButton!
    var btnStep:KDPulseButton!
    var btnRun:UIButton!
    var btnAdd:UIButton!
    var textField:UITextField!
    
    
    var y: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        spacing = view.bounds.size.width/CGFloat(widthRatio*3 + 4)
        btnSizeWidth = spacing*CGFloat(widthRatio)
        btnSizeHeight = btnSizeWidth*3/5
        y = view.bounds.size.height - spacing * 2 - btnSizeHeight
        yMax = y
        x = 2*spacing + btnSizeWidth
        
        addBtnReset()
        addBtnStep()
        addBtnRun()
        
    }
    
    func addBtnReset() {
        btnReset = KDPulseButton(frame: CGRect(x: spacing, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
//        btnReset.layer.backgroundColor = UIColor(red: 154/255, green: 205/255, blue: 50/255, alpha: 1).cgColor
        btnReset.layer.backgroundColor = UIColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1).cgColor
        btnReset.setTitle("\u{f021}", for: .normal)
        btnReset.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnReset.titleLabel?.font = UIFont.fontAwesome(ofSize: btnReset.fontoFitHeight())
        btnReset.setTitleColor(BUTTON_COLOR, for: .normal)
        btnReset.titleLabel?.adjustsFontSizeToFitWidth = true
        btnReset.titleLabel?.numberOfLines = 0
        btnReset.titleLabel?.minimumScaleFactor = 0.2
        btnReset.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        btnReset.titleLabel?.baselineAdjustment = .alignCenters
        btnReset.titleLabel?.textAlignment = .center
        btnReset.layer.borderWidth = 2
        btnReset.layer.borderColor = BUTTON_COLOR.cgColor
        btnReset.layer.cornerRadius = 10
        
        view.addSubview(btnReset)
    }
    
    
    
    
    func addBtnStep() {
        
        btnStep = KDPulseButton(frame: CGRect(x: x, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        
        btnStepTmp = btnStep
        
//        btnStep.layer.backgroundColor = UIColor(red: 204/255, green: 256/255, blue: 204/255, alpha: 1).cgColor
        btnStep.layer.backgroundColor = UIColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1).cgColor
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
        
        btnStep.layer.borderWidth = 2
        btnStep.layer.borderColor = BUTTON_COLOR.cgColor
        btnStep.layer.cornerRadius = 10
        
        
        view.addSubview(btnStep)
    }
    
    func addBtnRun() {
        
        btnRun = KDPulseButton(frame: CGRect(x: 2*x-spacing, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        
        btnRunTmp = btnRun
        
//        btnRun.layer.backgroundColor = UIColor(red: 204/255, green: 256/255, blue: 204/255, alpha: 1).cgColor
        btnRun.layer.backgroundColor = UIColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1).cgColor
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
        
        btnRun.layer.borderWidth = 2
        btnRun.layer.borderColor = BUTTON_COLOR.cgColor
        btnRun.layer.cornerRadius = 10
        
        
        view.addSubview(btnRun)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
