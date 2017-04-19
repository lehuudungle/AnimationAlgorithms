//
//  AboutVC.swift

//  Algorithms
//
//  Created by Loc Tran on 4/18/17.
//  Copyright © 2017 LocTran. All rights reserved.

//

import UIKit
struct AppUtility {

    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {

        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }

    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {

        self.lockOrientation(orientation)

        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
    
}

class AboutVC: UIViewController {
    
    @IBOutlet weak var locTxtView: UITextView!
    
    @IBOutlet weak var tungTxtView: UITextView!
    
    @IBOutlet weak var khanhTxtView: UITextView!
    
    @IBOutlet weak var dungTxtView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        addLabel()

        // Do any additional setup after loading the view.
    }


   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        AppUtility.lockOrientation(.portrait)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }

    func addLabel(){
        
        locTxtView.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 0.3)
        
        tungTxtView.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 0.3)
        
        dungTxtView.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 0.3)
        
        khanhTxtView.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 0.3)
        
        
        locTxtView.text = "Loc Tran \nhttps://www.linkedin.com/in/loc-tran-cs/"
        
        tungTxtView.text = "Tung Nguyen \nhttps://www.linkedin.com/in/nguyen-thanh-tung-0b1664124/"
        
        khanhTxtView.text = "Khanh Nguyen \nnguyenphuckhanh91@gmail.com"
        
        dungTxtView.text = "Dung Le \nhuudung95d@gmail.com"
    }

}
