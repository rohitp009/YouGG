//
//  HomeViewController.swift
//  YouGG
//
//  Created by Rohit Kumar on 02/05/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var vm: HomeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "YouGG"
        
        self.setUpCollectionView()
        
        self.vm.getHomeInfo {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    //CollectionView Initial Setup
    func setUpCollectionView() {
        
        collectionView.register(UINib(nibName: "GiftCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GiftCardCollectionViewCell")
        collectionView.register(UINib(nibName: "CategoryDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryDetailCollectionViewCell")
        
        collectionView.register(UINib(nibName: "HomeCollectionViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeCollectionViewHeader")
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        
        self.collectionView.reloadData()
    }

}

// MARK:- CollectionView delegate and datasource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if self.vm.categories.count > 0 {
            return 2
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return vm.getBrandsCountForSelectedCategory()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0{
            return CGSize.zero
        } else {
            return CGSize(width: self.collectionView.frame.size.width, height: 120)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionView.elementKindSectionHeader) && indexPath.section == 1 {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeCollectionViewHeader", for: indexPath) as! HomeCollectionViewHeader
            // Customize headerView here

            headerView.configureCell(categories: self.vm.categories, selectedIndex: self.vm.currentSelectedCategoryIndex())
            headerView.delegate = self
            return headerView
        }
        
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            
            var cell: GiftCardCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCollectionViewCell", for: indexPath) as? GiftCardCollectionViewCell
            if cell == nil {
                self.collectionView.register(UINib(nibName: "GiftCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GiftCardCollectionViewCell")
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCollectionViewCell", for: indexPath) as? GiftCardCollectionViewCell
                
            }
            
            if let model = self.vm.getBrandModelForSelectedCategory(index: indexPath.row) {
                cell.configureCell(model: model)
            }
            
            return cell
            
        } else {
            
            var cell: CategoryDetailCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryDetailCollectionViewCell", for: indexPath) as? CategoryDetailCollectionViewCell
            if cell == nil {
                self.collectionView.register(UINib(nibName: "CategoryDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryDetailCollectionViewCell")
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryDetailCollectionViewCell", for: indexPath) as? CategoryDetailCollectionViewCell
                
            }
            
            if let categoryModel = self.vm.getCurrentSelectedCategoryModel() {
                cell.configureCell(model: categoryModel)
            }
            return cell
        }
    }
}

// MARK:- CollectionView FlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: self.collectionView.frame.width, height: 250)
        } else {
            return CGSize(width: self.collectionView.frame.width/2-1, height: self.collectionView.frame.width/2-1)
        }
    }
}

// MARK:- Custom Delegate when user selects a category.
extension HomeViewController: HomeCollectionViewHeaderDelegate {
    
    func selectedCategoryIndexAndModel(model: CategoryModel) {
        
        if model.id != self.vm.currentSelectedCategoryId {
            
            self.vm.currentSelectedCategoryId = model.id
            
            // Fetch info from server if not available , else reload collection
            if vm.getBrandsCountForSelectedCategory() > 0 {
                self.collectionView.reloadData()
            } else {
                //Show Loader and hide on completion, Fetch list.
                self.vm.getHomeInfo {
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }
        } else {
            // Do Nothing For Now
        }
    }

}
