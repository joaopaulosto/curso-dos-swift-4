//
//  FontSize.swift
//  calculadora
//
//  Created by João Paulo Scopus on 22/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    func increaseFontSize () {
        self.font =  UIFont(name: (self.font?.fontName)!, size: (self.font?.pointSize)!+1)!
    }
    func decreaseFontSize () {
        self.font =  UIFont(name: (self.font?.fontName)!, size: (self.font?.pointSize)!-1)!
    }
}
