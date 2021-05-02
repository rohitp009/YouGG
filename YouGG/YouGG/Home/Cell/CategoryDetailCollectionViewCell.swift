//
//  CategoryDetailCollectionViewCell.swift
//  YouGG
//
//  Created by Rohit Kumar on 02/05/21.
//

import UIKit

class CategoryDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var giftCardTitleLabel: UILabel!
    @IBOutlet weak var giftCardDetailMessageLabel: UILabel!
    @IBOutlet weak var giftCardHowItWorksButton: UIButton!
    @IBOutlet weak var giftCardDetailImageView: UIImageView!
    @IBOutlet weak var transparentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.giftCardHowItWorksButton.layer.cornerRadius = 5.0
        self.giftCardHowItWorksButton.clipsToBounds = true
        self.giftCardHowItWorksButton.layer.borderWidth = 0.5
        self.giftCardHowItWorksButton.layer.borderColor = UIColor.white.cgColor
    }

    func configureCell(model: CategoryModel) {
        self.giftCardTitleLabel.text = model.title
        self.giftCardDetailMessageLabel.text = model.caption
        self.giftCardDetailImageView.load(url: URL(string: model.image_large!)!)
    }
}
