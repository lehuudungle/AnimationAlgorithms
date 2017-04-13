//
//  StartVC.swift
//  Algorithms
//
//  Created by Ledung95d on 4/12/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    var backgroundView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView = UIImageView(frame: CGRect(x: 0, y: self.view.frame.height*1/3, width: self.view.frame.width    , height: self.view.frame.height*1/3))
        backgroundView.image = UIImage(named: "shaper.jpg")
        backgroundView.alpha = 0
        
       self.view.addSubview(backgroundView)
    }


    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 4, animations: {
            self.backgroundView!.alpha = 1

        }){_ in
            MenuList.nextView()
            
        }
    }

}
