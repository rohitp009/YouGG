//
//  GiftCardCollectionViewCell.swift
//  YouGG
//
//  Created by Rohit Kumar on 02/05/21.
//

import UIKit

class GiftCardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var redemptionTagLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var giftCardTitleLabel: UILabel!
    @IBOutlet weak var giftCardMessageLabel: UILabel!
    @IBOutlet weak var giftCardImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.redemptionTagLabel.layer.cornerRadius = 6.0
        self.redemptionTagLabel.clipsToBounds = true
        self.redemptionTagLabel.layer.borderWidth = 0.5
        self.redemptionTagLabel.layer.borderColor = UIColor.lightGray.cgColor
        self.redemptionTagLabel.textColor = UIColor.black
        
        self.giftCardImageView.layer.cornerRadius = 5.0
        self.giftCardImageView.clipsToBounds = true
        self.containerView.layer.cornerRadius = 5.0
        self.containerView.clipsToBounds = true
        self.containerView.layer.borderWidth = 0.5
        self.containerView.layer.borderColor = UIColor.systemGray3.cgColor
    }

    func configureCell(model: BrandModel) {
        
        self.giftCardImageView.load(url: URL(string: model.product_image!)! )
        self.currencyLabel.text = model.currency
        self.giftCardTitleLabel.text = model.name.capitalized
        self.giftCardMessageLabel.text = model.short_tagline?.capitalized
        
        if let redemptioStr = model.redemption_tag {
            self.redemptionTagLabel.isHidden = false
            self.redemptionTagLabel.text = " \(redemptioStr.capitalized) "
        } else {
            self.redemptionTagLabel.isHidden = true
        }
        
    }
}
