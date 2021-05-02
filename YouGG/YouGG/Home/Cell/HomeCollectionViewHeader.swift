//
//  HomeCollectionViewHeader.swift
//  YouGG
//
//  Created by Rohit Kumar on 02/05/21.
//

import UIKit

protocol HomeCollectionViewHeaderDelegate: class {
    func selectedCategoryIndexAndModel(model: CategoryModel)
}

class HomeCollectionViewHeader: UICollectionReusableView {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    var selectedIndex: Int = 0
    weak var delegate: HomeCollectionViewHeaderDelegate?
    var categories: [CategoryModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setUpCollectionView()
    }
    
    func setUpCollectionView() {
        
        collectionView.register(UINib(nibName: "CategoryCollectionVIewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionVIewCell")
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
    
    func configureCell(categories: [CategoryModel], selectedIndex: Int) {
        
        self.categoryNameLabel.text = categories[selectedIndex].name
        self.selectedIndex = selectedIndex
        self.categories = categories
        self.collectionView.reloadData()
    }
    
}


extension HomeCollectionViewHeader: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: CategoryCollectionVIewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionVIewCell", for: indexPath) as? CategoryCollectionVIewCell
        if cell == nil {
            self.collectionView.register(UINib(nibName: "CategoryCollectionVIewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionVIewCell")
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionVIewCell", for: indexPath) as? CategoryCollectionVIewCell
            
        }
        
        var updateAsSelected: Bool = false
        if indexPath.row == self.selectedIndex {
            updateAsSelected = true
        }
        
        cell.configureCell(category: self.categories[indexPath.row], updateAsSelected: updateAsSelected)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.selectedCategoryIndexAndModel(model: self.categories[indexPath.row])
    }
}

extension HomeCollectionViewHeader: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 160, height: 90)
    }
}

