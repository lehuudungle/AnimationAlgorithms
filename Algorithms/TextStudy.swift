//
//  TextStudy.swift
//  Algorithms
//
//  Created by Ledung95d on 4/14/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class TextStudy: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 0.5)
        self.textAlignment = .center
        self.layer.borderColor = BUTTON_COLOR.cgColor
        self.layer.cornerRadius = 10
        self.numberOfLines = 6
        self.layer.borderWidth = 2
        self.layer.masksToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(".....")
    }

}
