//
//  ButtonTableViewCell.swift
//  ANF Code Test
//
//  Created by Thrinadh Ponnapati on 8/27/21.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var button: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button.layer.borderWidth = 2
        button.layer.borderColor = ColorConstants.buttonBorderColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
