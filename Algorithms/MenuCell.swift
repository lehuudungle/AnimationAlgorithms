//
//  MenuCell.swift
//  Algorithms
//
//  Created by Ledung95d on 4/11/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            backgroundColor = .red
        }else{
            backgroundColor = UIColor(red: 252/255, green: 182/255, blue: 193/255, alpha: 0.2)
        }
        // Configure the view for the selected state
    }
    
}
