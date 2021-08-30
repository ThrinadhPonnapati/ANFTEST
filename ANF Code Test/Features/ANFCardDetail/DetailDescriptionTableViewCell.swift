//
//  DetailDescriptionTableViewCell.swift
//  ANF Code Test
//
//  Created by Thrinadh Ponnapati on 8/29/21.
//

import UIKit

class DetailDescriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var topDescriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var promoMessageLabel: UILabel!
    @IBOutlet weak var bottomDescriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpUIData(exploreData : ExploreDataModel){
            topDescriptionLabel.text = exploreData.topDescription
            titleLabel.text = exploreData.title
            promoMessageLabel.text = exploreData.promoMessage
            bottomDescriptionLabel.text = exploreData.bottomDescription
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
