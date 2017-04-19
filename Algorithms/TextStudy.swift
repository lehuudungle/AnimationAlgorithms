//
//  TextStudy.swift
//  Algorithms
//
//  Created by Ledung95d on 4/14/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class TextStudy: UIBorderedLabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
//        self.textAlignment = .center
//        self.layer.borderColor = BUTTON_COLOR.cgColor
        self.layer.cornerRadius = 10
        self.numberOfLines = 6
//        self.layer.borderWidth = 2
        self.layer.masksToBounds = true
        self.font = UIFont.boldSystemFont(ofSize:16)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(".....")
    }

}
