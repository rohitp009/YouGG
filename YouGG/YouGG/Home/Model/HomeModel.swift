//
//  HomeModel.swift
//  YouGG
//
//  Created by Rohit Kumar on 02/05/21.
//

import Foundation

struct HomeModel: Codable {
    
    var brands: [BrandModel]
    var categories: [CategoryModel]
}
