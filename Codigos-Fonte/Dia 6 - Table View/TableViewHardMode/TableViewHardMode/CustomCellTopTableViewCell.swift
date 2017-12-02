//
//  CustomCellTopTableViewCell.swift
//  TableViewHardMode
//
//  Created by João Paulo Scopus on 30/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class CustomCellTopTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCellTop: UIImageView!
    @IBOutlet weak var titleCellTop: UILabel!
    @IBOutlet weak var detailTopCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
