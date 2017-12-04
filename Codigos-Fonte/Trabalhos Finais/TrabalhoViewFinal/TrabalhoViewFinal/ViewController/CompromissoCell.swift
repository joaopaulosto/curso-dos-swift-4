//
//  CompromissoCell.swift
//  TrabalhoViewFinal
//
//  Created by João Paulo Scopus on 03/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class CompromissoCell: UITableViewCell {

    @IBOutlet weak var descricao: UILabel!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var statusImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
