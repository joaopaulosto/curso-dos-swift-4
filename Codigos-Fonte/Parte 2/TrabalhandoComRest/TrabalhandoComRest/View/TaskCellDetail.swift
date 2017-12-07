//
//  TaskCellDetail.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 06/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class TaskCellDetail: UITableViewCell {

    @IBOutlet weak var flagFinish: UIView!
    @IBOutlet weak var titleTask: UILabel!
    @IBOutlet weak var timeTask: UILabel!
    @IBOutlet weak var detailTask: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
