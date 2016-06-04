//
//  placeTableViewCell.swift
//  tranquilLondon
//
//  Created by Daniel Pape on 08/03/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit

class placeTableViewCell: UITableViewCell {

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeDistanceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        helperMethods().makeImageRound(placeImage)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
