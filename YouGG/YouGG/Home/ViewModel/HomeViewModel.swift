//
//  HomeViewModel.swift
//  YouGG
//
//  Created by Rohit Kumar on 02/05/21.
//

import Foundation

class HomeViewModel {
    
    var categories: [CategoryModel] = []
    var currentSelectedCategoryId: Int = 32
    var homeModel: [Int:[BrandModel]] = [:]
    var apiResource: HomeResourceProtocol?
    
    init() {
        self.apiResource = HomeResource()
    }
    
    //Api call
    func getHomeInfo(completed: (()->Void)?) {
        
        apiResource?.fetchGifts(selectedCategory: currentSelectedCategoryId) { (model) in
            guard let ml = model else {
                return
            }
            
            if self.categories.count == 0 {
                self.categories = ml.categories
            }
            self.homeModel[self.currentSelectedCategoryId] = ml.brands
            
            completed?()
        }
        
    }
    
    // Return Brands count in current selected category.
    func getBrandsCountForSelectedCategory() -> Int {
        return self.homeModel[self.currentSelectedCategoryId]?.count ?? 0
    }
    
    // Return Brand Model at specific index in current selected category.
    func getBrandModelForSelectedCategory(index: Int) -> BrandModel? {
        guard let model = self.homeModel[self.currentSelectedCategoryId]?[index] else {
            return nil
        }
        return model
    }
    
    // Return current selected category index in categories array.
    func currentSelectedCategoryIndex() -> Int {
        
        var index = 0
        for item in self.categories {
            if item.id == self.currentSelectedCategoryId {
                return index
            }
            index += 1
        }
        return index
    }
    
    // Return current selected Category model.
    func getCurrentSelectedCategoryModel() -> CategoryModel? {
        
        if self.categories.count > 0 {
            let currentSelectedCategory = self.categories.filter { (model) -> Bool in
                if model.id == self.currentSelectedCategoryId {
                    return true
                }
                return false
            }
            if currentSelectedCategory.count > 0 {
                return currentSelectedCategory.first
            }
        }
        
        return nil
    }
}
