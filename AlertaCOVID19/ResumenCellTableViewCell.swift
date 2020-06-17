//
//  ResumenCellTableViewCell.swift
//  AlertaCOVID19
//
//  Created by David Ochoa on 05/04/20.
//  Copyright © 2020 David Ochoa. All rights reserved.
//

import UIKit

class ResumenCellTableViewCell: UITableViewCell {
    @IBOutlet weak var cellLabelMunicipio: UILabel!
    @IBOutlet weak var cellLabelCasos: UILabel!
    
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    } */
    
    func SetDataCasos(municipio: String, casos: String){
        cellLabelMunicipio.text = municipio
        cellLabelCasos.text = casos
    }

}
