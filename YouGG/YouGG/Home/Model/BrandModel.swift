//
//  HomeModel.swift
//  YouGG
//
//  Created by Rohit Kumar on 02/05/21.
//

import Foundation

struct BrandModel: Codable {
    
    var id: Int
    var name: String
    var logo: String?
    var product_image: String?
    var short_tagline: String?
    var is_generic: Bool?
    var seo_name: String?
    var currency: String?
    var detail_url: String?
    var redemption_tag: String?
    var detail_url_v5: String?
    
}
