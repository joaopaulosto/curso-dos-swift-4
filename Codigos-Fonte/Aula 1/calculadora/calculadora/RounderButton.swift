//
//  RounderButton.swift
//  calculadora
//
//  Created by João Paulo Scopus on 21/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RounderButton: UIButton {
    override func layoutSubviews(){
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    func updateCornerRadius(){
        layer.cornerRadius = rounded ? frame.size.height / 2: 0
    }
}
