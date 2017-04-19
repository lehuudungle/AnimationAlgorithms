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

class ViewController: UIViewController {
  

    var gamemanager: GameManager!
    var mainViewSize = CGSize()
    var sizeBoard:UITextField!
    var spacing:CGFloat!
    var widthRatio = 3
    var btnSizeWidth:CGFloat!
    var btnSizeHeight:CGFloat!
    var x:CGFloat!

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


    }
    
   
    
    @objc func draw(sender: UIButton){
        self.gamemanager.btnNext.isUserInteractionEnabled = true
        self.gamemanager.boardView.removeFromSuperview()
        self.gamemanager.btnStart.isHidden = true
        self.gamemanager.lblSolutionFound.isHidden = true
        self.gamemanager.rowTotal = Int(self.sizeBoard.text!)!
        self.gamemanager.colTotal = Int(self.sizeBoard.text!)!
        self.gamemanager.initGameWith(viewcontroller: self, size: self.view.bounds.size.width)


    }
    
    func btnSizeBoard(){
        let btn = KDPulseButton(frame: CGRect(x: 2*x-spacing, y: view.bounds.size.height-2*spacing-2*btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btn.layer.backgroundColor = UIColor(red: 204/255, green: 256/255, blue: 204/255, alpha: 1).cgColor
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

