//
//  CategoryModel.swift
//  YouGG
//
//  Created by Rohit Kumar on 02/05/21.
//

import Foundation

struct CategoryModel: Codable {
    
    var id: Int
    var name: String
    var seo_name: String?
    var image_large: String?
    var image_small: String?
    var title: String?
    var caption: String?
    var default_display: Bool?
    var bg_color_code: String?
    var tag_type: String?
    var icon_image: String?
    
}
