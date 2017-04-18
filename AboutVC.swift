//
//  AboutVC.swift
//  Algorithms
//
//  Created by Loc Tran on 4/18/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    @IBOutlet weak var LocLabel: UIBorderedLabel!
    @IBOutlet weak var TungLabel: UIBorderedLabel!
    @IBOutlet weak var KhanhLabel: UIBorderedLabel!
    @IBOutlet weak var DungLabel: UIBorderedLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLabel()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addLabel(){
        LocLabel.numberOfLines = 6
        TungLabel.numberOfLines = 6
        KhanhLabel.numberOfLines = 6
        DungLabel.numberOfLines = 6
        
        LocLabel.text = "Loc Tran \n https://www.linkedin.com/in/loc-tran-cs/"
        TungLabel.text = "Thanh Tung Nguyen \n https://www.linkedin.com/in/nguyen-thanh-tung-0b1664124/"
        KhanhLabel.text = "Khanh Nguyen \n nguyenphuckhanh91@gmail.com"
        DungLabel.text = "Huu Dung \n huudung95d@gmail.com"
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
