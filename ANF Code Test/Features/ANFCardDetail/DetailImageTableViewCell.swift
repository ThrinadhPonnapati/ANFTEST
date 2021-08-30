//
//  DetailImageTableViewCell.swift
//  ANF Code Test
//
//  Created by Thrinadh Ponnapati on 8/29/21.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imageView1: UIImageView!
    
    internal var aspectConstraint : NSLayoutConstraint? {
           didSet {
               if oldValue != nil {
                imageView1.removeConstraint(oldValue!)
               }
               if aspectConstraint != nil {
                imageView1.addConstraint(aspectConstraint!)
               }
           }
       }

       override func prepareForReuse() {
           super.prepareForReuse()
           aspectConstraint = nil
       }

    func setCustomImage(image : UIImage) {
        
        let aspect = image.size.width / image.size.height
        
        let constraint = NSLayoutConstraint(item: imageView1!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: imageView1, attribute: NSLayoutConstraint.Attribute.height, multiplier: aspect, constant: 0.0)
        aspectConstraint = constraint
        
        imageView1.image = image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpUIData(exploreDataModel : ExploreDataModel){
        ImageDownloader.shared.downloadImage(with: exploreDataModel.backgroundImage, completionHandler: {[self] image, isLoaded in
            setCustomImage(image: image!)
        }, placeholderImage: UIImage.init(named: "placeholder"))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
