//
//  HeaderTableViewCell.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/2/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var lblNameCategory: UILabel!
    @IBOutlet weak var lblTotalEncuestas: UILabel!
    var covEnable: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}


