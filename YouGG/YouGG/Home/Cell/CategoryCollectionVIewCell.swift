//
//  CategoryDetailCollectionVIewCell.swift
//  YouGG
//
//  Created by Rohit Kumar on 02/05/21.
//

import UIKit

class CategoryCollectionVIewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var transparentView: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.imageView.layer.cornerRadius = 5.0
        self.imageView.clipsToBounds = true
        self.transparentView.layer.cornerRadius = 5.0
        self.transparentView.clipsToBounds = true

    }
    
    func configureCell(category: CategoryModel, updateAsSelected: Bool) {
        self.titleLabel.text = category.name
        if updateAsSelected {
            self.transparentView.alpha = 1.0
            self.transparentView.backgroundColor = UIColor.systemBlue
        } else {
            self.transparentView.alpha = 0.3
            self.transparentView.backgroundColor = UIColor.black
            self.imageView.load(url: URL(string: category.image_small!)! )
        }
    }

}
