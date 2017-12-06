//
//  ScrollViewController.swift
//  TrabalhoViewFinal
//
//  Created by João Paulo Scopus on 04/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    
    var praCima: Bool = true
    @IBOutlet weak var myScroll: UIScrollView!


}

extension ScrollViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Estou movimentando")
    }
    
}
