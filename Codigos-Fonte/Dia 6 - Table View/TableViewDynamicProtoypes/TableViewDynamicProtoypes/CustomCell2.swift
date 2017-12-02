//
//  CustomCell2.swift
//  TableViewDynamicProtoypes
//
//  Created by João Paulo Scopus on 29/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class CustomCell2: UITableViewCell {

    @IBOutlet weak var detailCell: UILabel!
    @IBOutlet weak var titleCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
