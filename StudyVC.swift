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
    var btnStep:UIButton!
    var btnRun:UIButton!
    var btnAdd:UIButton!
    var textField:UITextField!
    var arrayView:UILabel!
    
    var y: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 245/255, green: 222/255, blue: 179/255, alpha: 1)

        spacing = view.bounds.size.width/CGFloat(widthRatio*3 + 4)
        btnSizeWidth = spacing*CGFloat(widthRatio)
        btnSizeHeight = btnSizeWidth*3/5
        y = view.bounds.size.height - spacing * 2 - btnSizeHeight
        yMax = y
        x = 2*spacing + btnSizeWidth
        
        addBtnReset()
//        addBtnInfo()
        addBtnStep()
        addBtnRun()
        
    }
    
    func addBtnReset() {
        btnReset = KDPulseButton(frame: CGRect(x: spacing, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnReset.layer.backgroundColor = GREEN_COLOR.cgColor
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
        btnReset.layer.cornerRadius = 10




        view.addSubview(btnReset)
    }
    
//    func addBtnInfo() {
//        
//        btnInfo = UIButton(frame: CGRect(x: x, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
//        btnInfo.backgroundColor = UIColor.green.withAlphaComponent(0.5)
//        btnInfo.setTitleColor(UIColor.white, for: UIControlState.normal)
//        btnInfo.setTitle("\u{f05a}", for: .normal)
//        btnInfo.titleLabel?.textColor = UIColor.white
//        btnInfo.titleLabel?.font = UIFont.fontAwesome(ofSize: btnInfo.fontoFitHeight())
//        btnInfo.setTitleColor(BUTTON_COLOR, for: .normal)
//        btnInfo.titleLabel?.adjustsFontSizeToFitWidth = true
//        btnInfo.titleLabel?.numberOfLines = 0
//        btnInfo.titleLabel?.minimumScaleFactor = 0.2
//        btnInfo.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
//        btnInfo.titleLabel?.baselineAdjustment = .alignCenters
//        btnInfo.titleLabel?.textAlignment = .center
//        btnInfo.layer.cornerRadius = 10
//
//        
//        view.addSubview(btnInfo)
//    }
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
