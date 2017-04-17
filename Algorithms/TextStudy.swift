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
        
        self.textAlignment = .center
        self.layer.borderWidth = 2
        self.layer.borderColor = BUTTON_COLOR.cgColor
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.numberOfLines = 5
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(".....")
    }

}
