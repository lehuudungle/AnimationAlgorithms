//
//  GameManager.swift
//  Chess
//
//  Created by Tuuu on 3/8/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation
import UIKit
import KDPulseButton


class GameManager: UIView
{
    
    var boardView: Board!
    var playedMoves: [Move]!
    var turn: PieceColor!
    var players: [Player]!
    var pieceSets:[PieceSet]! // 1-->2
    var pieceSetOnTop: PieceColor!
    var delegate: PieceSetDelegate!
    var mainView: UIView!
    var fromPosition: UITextField!
    var toPosition: UITextField!
    var nQueens:EightQueen!
    var queens = [[Position]]()
    var stepSolutions = [[QStep]]()
    var rowTotal = 4
    var colTotal = 4
    var dem = 0
    var lblSolutionFound:UILabel!
    var btnStart:UIButton!
    var btnNext:UIButton!
    var btnPauseAction: UIButton!
    var btnReset:UIButton!
    
    var spacing:CGFloat!
    var widthRatio = 3
    var btnSizeWidth:CGFloat!
    var btnSizeHeight:CGFloat!
    var x:CGFloat!
    var count:Int!
    var isPause: Bool!
    var pause: Bool = false{
        didSet {
            if pause == false{
                autoAnimation()
            }
        }
    }
    
    
    func initGameWith(viewcontroller: UIViewController, size: CGFloat)
    {
        count = 0
        spacing = viewcontroller.view.bounds.size.width/CGFloat(widthRatio*3 + 4)
        btnSizeWidth = spacing*CGFloat(widthRatio)
        btnSizeHeight = btnSizeWidth*3/5
        x = 2*spacing + btnSizeWidth
        
        
        boardView = Board(frame: CGRect(x: 0,
                                        y: viewcontroller.view.bounds.size.height / 2 - size*5/8,
                                        width: size, height: size),
                          rowTotal: rowTotal,
                          colTotal: colTotal)
        viewcontroller.view.addSubview(boardView)
        self.mainView = boardView
        
        let width = self.mainView.frame.width/CGFloat(colTotal)
        self.addPieceSet(rowTotal: rowTotal, colTotal: colTotal, width: width)
        
        self.addBtnMove(toView: viewcontroller.view)
        self.addSolutionText(toView: viewcontroller.view)
        self.addSolutionFound(toView: viewcontroller.view)
        self.addBtnNext(toView: viewcontroller.view)
        //        self.addBtnPrevious(toView: viewcontroller.view)
        self.addReset(toView: viewcontroller.view)
        self.btnPause(toView: viewcontroller.view)
        isPause = false
        btnPauseAction.isHidden = true
        
        //      self.addTextField(toView: viewcontroller.view)
        
    }
    
    
    
    func addSolutionText(toView view: UIView){
        let lbl = UILabel(frame: CGRect(x: view.bounds.size.width/2-120, y: view.bounds.size.height / 2 - view.bounds.size.width*5/8 - 40, width: 120, height: 30))
        lbl.text = "Solution Found: "
        view.addSubview(lbl)
        
    }
    func addSolutionFound(toView view: UIView){
        lblSolutionFound = UILabel(frame: CGRect(x: view.bounds.size.width/2 + 20, y: view.bounds.size.height / 2 - view.bounds.size.width*5/8 - 40, width: 50, height: 30))
        lblSolutionFound.text = "0"
        view.addSubview(lblSolutionFound)
    }
    
    
    func addBtnMove(toView view: UIView)
    {
        btnStart = KDPulseButton(frame: CGRect(x: 2*x-spacing, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnStart.layer.backgroundColor = LIME_COLOR.cgColor
        btnStart.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnStart.setTitle("\u{f144}", for: .normal)
        btnStart.titleLabel?.font = UIFont.fontAwesome(ofSize: btnStart.fontoFitHeight())
        btnStart.setTitleColor(BUTTON_COLOR, for: .normal)
        btnStart.titleLabel?.adjustsFontSizeToFitWidth = true
        btnStart.titleLabel?.numberOfLines = 0
        btnStart.titleLabel?.minimumScaleFactor = 0.2
        btnStart.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        btnStart.titleLabel?.baselineAdjustment = .alignCenters
        btnStart.titleLabel?.textAlignment = .center
        btnStart.layer.borderWidth = 2
        btnStart.layer.borderColor = BUTTON_COLOR.cgColor
        btnStart.layer.cornerRadius = 10
        btnStart.addTarget(self, action: #selector(move(sender:)), for: .touchUpInside)
        view.addSubview(btnStart)
    }
    @objc func move(sender: UIButton)
    {
        btnNext.isUserInteractionEnabled = false
        btnReset.isUserInteractionEnabled = false
        btnStart.isHidden = true
        btnPauseAction.isHidden = false
        btnNext.layer.backgroundColor = UIColor.gray.cgColor
        btnNext.setNeedsDisplay()
        btnReset.layer.backgroundColor = UIColor.gray.cgColor
        btnReset.setNeedsDisplay()
        if isPause == true{
            pause = !pause
        }
        moveQueen()
        
        
        
        
    }
    func addReset(toView view: UIView){
        btnReset = KDPulseButton(frame: CGRect(x: spacing, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnReset.layer.backgroundColor = LIME_COLOR.cgColor
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
        btnReset.layer.borderWidth = 2
        btnReset.layer.borderColor = BUTTON_COLOR.cgColor
        btnReset.layer.cornerRadius = 10
        
        btnReset.addTarget(self, action: #selector(reset(sender:)), for: .touchUpInside)
        view.addSubview(btnReset)
    }
    @objc func reset(sender: UIButton){
        btnNext.isUserInteractionEnabled = true
        btnPauseAction.isHidden = true
        removeAllPieces()
        btnStart.isUserInteractionEnabled = true
        btnStart.isHidden = false
        btnReset.layer.backgroundColor = LIME_COLOR.cgColor
        btnNext.layer.backgroundColor = LIME_COLOR.cgColor
        btnStart.layer.backgroundColor = LIME_COLOR.cgColor
        btnSizeBoardTmp.layer.backgroundColor = LIME_COLOR.cgColor
        btnSizeBoardTmp.setNeedsDisplay()
        btnReset.setNeedsDisplay()
        btnNext.setNeedsDisplay()
        btnStart.setNeedsDisplay()
        
        self.currentIndexQueen = 0
        self.rowSolution = 0
        self.colSolution = 0
        self.dem = 0
        count = 0
        self.lblSolutionFound.text = "0"
       
        
    }
    
    func btnPause(toView view: UIView){
        
        btnPauseAction = KDPulseButton(frame: CGRect(x: 2*x-spacing, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnPauseAction.layer.backgroundColor = LIME_COLOR.cgColor
        btnPauseAction.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnPauseAction.setTitle("Pause", for: .normal)
        
        btnPauseAction.setTitleColor(BUTTON_COLOR, for: .normal)
        btnPauseAction.titleLabel?.font = UIFont.fontAwesome(ofSize: btnPauseAction.fontoFitHeight())
        btnPauseAction.titleLabel?.adjustsFontSizeToFitWidth = true
        btnPauseAction.titleLabel?.numberOfLines = 0
        btnPauseAction.titleLabel?.minimumScaleFactor = 0.2
        btnPauseAction.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        btnPauseAction.titleLabel?.baselineAdjustment = .alignCenters
        btnPauseAction.titleLabel?.textAlignment = .center
        
        btnPauseAction.layer.borderWidth = 2
        btnPauseAction.layer.borderColor = BUTTON_COLOR.cgColor
        btnPauseAction.layer.cornerRadius = 10
        
        btnPauseAction.addTarget(self, action: #selector(action_Pause(_:)), for: .touchUpInside)
        view.addSubview(btnPauseAction)
        
    }
    
    
    @IBAction func action_Pause(_ sender: UIButton) {
        pause = !pause
        if count == 0{
            btnPauseAction.setTitle("\u{f144}", for: .normal)
            btnReset.isUserInteractionEnabled = true
            btnReset.layer.backgroundColor = LIME_COLOR.cgColor
            btnReset.setNeedsDisplay()
            count = 1
            isPause = true
        }else{
            btnPauseAction.setTitle("Pause", for: .normal)
            btnSizeBoardTmp.isUserInteractionEnabled = false
            btnSizeBoardTmp.layer.backgroundColor = UIColor.gray.cgColor
            btnSizeBoardTmp.setNeedsDisplay()
            btnReset.layer.backgroundColor = UIColor.gray.cgColor
            btnReset.setNeedsDisplay()
            btnReset.isUserInteractionEnabled = false
            btnNext.isUserInteractionEnabled = false
            count = 0
            isPause = false
        }
    }
    
    
    func addBtnNext(toView view: UIView){
        btnNext = KDPulseButton(frame: CGRect(x: x, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnNext.layer.backgroundColor = LIME_COLOR.cgColor
        btnNext.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnNext.setTitle("\u{f051}", for: .normal)
        btnNext.setTitleColor(BUTTON_COLOR, for: .normal)
        btnNext.titleLabel?.font = UIFont.fontAwesome(ofSize: btnNext.fontoFitHeight())
        btnNext.titleLabel?.adjustsFontSizeToFitWidth = true
        btnNext.titleLabel?.numberOfLines = 0
        btnNext.titleLabel?.minimumScaleFactor = 0.2
        btnNext.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        btnNext.titleLabel?.baselineAdjustment = .alignCenters
        btnNext.titleLabel?.textAlignment = .center
        
        btnNext.layer.borderWidth = 2
        btnNext.layer.borderColor = BUTTON_COLOR.cgColor
        btnNext.layer.cornerRadius = 10
        
        btnNext.addTarget(self, action: #selector(next(sender:)), for: .touchUpInside)
        view.addSubview(btnNext)
    }
    
    func addBtnPrevious(toView view: UIView){
        let btn = UIButton(frame: CGRect(x: view.bounds.size.width/2-160, y: view.bounds.size.height-70, width: 80, height: 40))
        btn.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.setTitle("Previous", for: .normal)
        btn.addTarget(self, action: #selector(previvous(sender:)), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func next(sender: UIButton){
        btnStart.isUserInteractionEnabled = false
        btnStart.layer.backgroundColor = UIColor.gray.cgColor
        btnStart.setNeedsDisplay()
        
        nextAction()
    }
    @objc func previvous(sender: UIButton){
        self.btnNext.isUserInteractionEnabled = true
        
        previousAction()
        
    }
    
    
    
    //vong lap animation
    
    var currentIndexQueen = 0
    var rowSolution = 0
    var colSolution = 0
    var currentSolition = [QStep]()
    func removeAllPieces()
    {
        self.pieceSets.first?.removeAllPieceControllers()
    }
    func removeBacktrackedPieces(backtrackStep: QStep)
    {
        if(self.colSolution > 0)
        {
            self.pieceSets.first?.removeBacktrackedPieceControllers(backtrack: backtrackStep)
        }
    }
    func loop()
    {
        removeAllPieces()
        currentSolition = self.stepSolutions[self.rowSolution]
        autoAnimation()
    }
    
    func nextAction(){
        currentSolition = self.stepSolutions[self.rowSolution]
        nextAnimation()
        
    }
    
    func previousAction(){
        
        currentSolition = self.stepSolutions[self.rowSolution]
        previousAnimation()
    }
    
    func nextAnimation(){
        
        
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 0.005, animations: {
            //Nếu bước đi mà là backtrack thì sẽ xoá các dòng và quay lại root của piece hiện tại
            if(self.currentSolition[self.colSolution].backtrack > 0)
            {
                self.removeBacktrackedPieces(backtrackStep: self.currentSolition[self.colSolution])
            }
            else
            {
                //Nếu vị trí đúng thì add piece
                if(self.currentSolition[self.colSolution].isTrue == true)
                {
                    self.pieceSets.first?.addnewQueenAt(position: Position(row: self.currentSolition[self.colSolution].position.row-1, col: self.currentSolition[self.colSolution].position.col-1), isTrue: true)
                }
                else
                {   //ngược lại add dấu X
                    self.pieceSets.first?.addnewQueenAt(position: Position(row: self.currentSolition[self.colSolution].position.row-1, col: self.currentSolition[self.colSolution].position.col-1), isTrue: false)
                }
            }
            
        }) { (finished) in
            //Kiem tra dau la buoc dung
            if(self.currentSolition[self.colSolution].position.row == self.rowTotal && self.currentSolition[self.colSolution].isTrue == true){
                self.dem = self.dem + 1
                self.lblSolutionFound.text = String(self.dem)
            }
            if (self.currentSolition[self.colSolution].position.row == 2 && self.currentSolition[self.colSolution].position.col == self.colTotal && self.currentSolition[self.colSolution].isTrue == false){
                
                self.btnNext.isUserInteractionEnabled = false
                
            }
            
            self.colSolution = self.colSolution + 1
            
            // Neu col la dong cuoi thi solution do tang row len 1
            if (self.colSolution == self.currentSolition.count)
            {
                if(self.rowSolution == self.stepSolutions.count-1)
                {
                    return
                }
                self.colSolution = 0
                self.rowSolution = self.rowSolution + 1
                //              self.pieceSets.first?.savePreviousControllers()
            }
        }
    }
    func previousAnimation(){
        self.colSolution = self.colSolution - 1
        let checkBackTrackSolution = self.currentSolition[self.colSolution]
        
        if(checkBackTrackSolution.backtrack > 0){
            for index in 1 ... checkBackTrackSolution.backtrack {
                self.colSolution = self.colSolution - index*self.colTotal - 1
            }
        }
        
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 0.005, animations: {
            
            let currentPiece = self.pieceSets.first?.getPieceControllerAt(position: Position(row: self.currentSolition[self.colSolution].position.row-1, col: self.currentSolition[self.colSolution].position.col-1))
            self.removeAllPieces()
            
            self.removeAllPieces()
            
            for i in (currentPiece?.pieceModel.prePiece.state)!
            {
                var isQueen: Bool!
                if i.type == .Queen{
                    isQueen = true
                }
                else if i.type == .None{
                    isQueen = false
                }
                self.pieceSets.first?.addnewQueenAt(position: i.position, isTrue: isQueen)
            }
            //            }
            //            else{
            //                self.pieceSets.first?.removePieceController(pieceController: (self.pieceSets.first?.getPieceControllerAt(position: Position(row: self.currentSolition[self.colSolution].position.row-1, col: self.currentSolition[self.colSolution].position.col-1)))!)
            //
            //            }
            //            self.pieceSets.first?.addnewQueenAt(position: (self.pieceSets.first?.prePiece.placeAt)!, isTrue: self.pieceSets.first?.prePiece.type)
            //            self.colSolution = self.colSolution - 1
            //
            //            self.pieceSets.first?.removePieceController(pieceController: (self.pieceSets.first?.getPieceControllerAt(position: Position(row: self.currentSolition[self.colSolution].position.row-1, col: self.currentSolition[self.colSolution].position.col-1)))!)
            
            
            //            self.pieceSets.first?.setPreviousControllers()
            
        }) { (finished) in
            
            //            self.colSolution = self.colSolution - 1
            _ = self.pieceSets.first?.getPieceControllerAt(position: Position(row: self.currentSolition[self.colSolution].position.row-1, col: self.currentSolition[self.colSolution].position.col-1))
        }
    }
    
    func autoAnimation()
    {
        guard !pause else {
            return
        }
        
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 0.005, animations: {
            //Nếu bước đi mà là backtrack thì sẽ xoá các dòng và quay lại root của piece hiện tại
            if(self.currentSolition[self.colSolution].backtrack > 0)
            {
                self.removeBacktrackedPieces(backtrackStep: self.currentSolition[self.colSolution])
            }
            else
            {
                //Nếu vị trí đúng thì add piece
                if(self.currentSolition[self.colSolution].isTrue == true)
                {
                    self.pieceSets.first?.addnewQueenAt(position: Position(row: self.currentSolition[self.colSolution].position.row-1, col: self.currentSolition[self.colSolution].position.col-1), isTrue: true)
                }
                else
                {   //ngược lại add dấu X
                    
                    self.pieceSets.first?.addnewQueenAt(position: Position(row: self.currentSolition[self.colSolution].position.row-1, col: self.currentSolition[self.colSolution].position.col-1), isTrue: false)
                }
            }
        }) { (finished) in
            //Kiem tra dau la buoc dung
            if(self.currentSolition[self.colSolution].position.row == self.rowTotal && self.currentSolition[self.colSolution].isTrue == true){
                self.dem = self.dem + 1
                self.lblSolutionFound.text = String(self.dem)
            }
            if (self.currentSolition[self.colSolution].position.row == 2 && self.currentSolition[self.colSolution].position.col == self.colTotal && self.currentSolition[self.colSolution].isTrue == false){
                self.btnNext.isUserInteractionEnabled = false
                self.btnStart.isUserInteractionEnabled = false
            }
            
            
            //Khi kết thúc animation thì tăng col lên 1
            self.colSolution = self.colSolution + 1
            
            // Neu col la dong cuoi thi solution do tang row len 1
            
            if (self.colSolution == self.currentSolition.count)
            {
                if(self.rowSolution == self.stepSolutions.count-1)
                {
                    return
                }
                self.colSolution = 0
                self.rowSolution = self.rowSolution + 1
                self.loop()
                return
            }

            self.autoAnimation()
        }
    }
    func moveQueen(){
        loop()
        
    }
    func addTextField(toView view: UIView)
    {
        fromPosition = UITextField(frame: CGRect(x: 80, y: 50, width: 60, height: 30))
        fromPosition.backgroundColor = UIColor.gray
        fromPosition.textColor = UIColor.white
        fromPosition.placeholder = "row-col"
        
        toPosition = UITextField(frame: CGRect(x: 150, y: 50, width: 60, height: 30))
        toPosition.backgroundColor = UIColor.gray
        toPosition.textColor = UIColor.white
        toPosition.placeholder = "row-col"
        
        view.addSubview(fromPosition)
        view.addSubview(toPosition)
    }
    
    
    private func addPieceSet(rowTotal: Int, colTotal: Int, width: CGFloat)
    {
        nQueens = EightQueen(row: self.rowTotal, col: self.rowTotal)
        self.stepSolutions = nQueens.stepSolutions
        self.pieceSets = [PieceSet]()
        
        let whitePieceSet = PieceSet(color: .White,
                                     rowTotal: rowTotal,
                                     colTotal: colTotal,
                                     width: width)
        whitePieceSet.delegate = self
        //        whitePieceSet.addPieces()
        
        self.pieceSetOnTop = PieceColor.White
        
        self.pieceSets.append(whitePieceSet)
        //        self.pieceSets.append(blackPieceSet)
    }
    func addMove()
    {
    }
    func create()
    {
    }
    func isEnded()
    {}
    func isChecked()
    {}
    func operation()
    {}
    func isCheckMated()
    {
    }
    
}
extension GameManager: PieceSetDelegate
{
    func didRemovePieceController(pieceView: PieceView)
    {
        pieceView.removeFromSuperview()
    }
    func didFinishInitPieceSet(pieceControllers: [PieceController]) {
        for pieceController in pieceControllers
        {
            self.mainView.addSubview(pieceController.pieceView)
        }
    }
    func didFinishAddNewPiece(pieceController: PieceController){
        self.mainView.addSubview(pieceController.pieceView)
    }
}
