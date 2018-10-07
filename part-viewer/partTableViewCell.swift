//
//  partTableViewCell.swift
//  part-viewer
//
//  Created by Wojciech Szczurek on 9/3/18.
//  Copyright © 2018 Wojciech Szczurek. All rights reserved.
//

import UIKit

class partTableViewCell: UITableViewCell {

    @IBOutlet weak var partName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
