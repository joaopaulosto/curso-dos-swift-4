//
//  TableViewCell.swift
//  TableViewDynamicProtoypes
//
//  Created by João Paulo Scopus on 29/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

 
    @IBOutlet weak var algumaCoisa: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
 /*       img.image? = (img.image?.withRenderingMode(.alwaysTemplate))!
        img.tintColor = UIColor.magenta */
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
