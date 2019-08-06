//
//  ButtonTableViewCell.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/3/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import UIKit

protocol showAndHideDelegate{
    func showHide(index: IndexPath)
}

class ButtonTableViewCell: UITableViewCell {
    
    var showHideDelegate: showAndHideDelegate?
    var indice: IndexPath!
    

    @IBOutlet weak var btnShowAndHide: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    @IBAction func showAndHide(_ sender: Any) {
        indice.row = 1
        showHideDelegate?.showHide(index: indice)
        
    }
    
}
