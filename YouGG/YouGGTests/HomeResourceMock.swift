//
//  HomeResourceMock.swift
//  YouGGTests
//
//  Created by Rohit Kumar on 02/05/21.
//

import UIKit


class HomeResourceMock: HomeResourceProtocol {
    
    func fetchGifts(selectedCategory: Int,completionHandler: @escaping (HomeModel?) -> Void) {
        
        let jsonString =
            """
        {
            "label": "Featured",
            "paginated_data": {
                "count": 185,
                "previous": null,
                "next": "https://emapi-sandbox.yougotagift.com/uae/api/v3/brands/featured/?api_key=2vq1M9ye4eV6H1Mr&api_secret=wnRY14QoA99B4Ae6wn2CU2y8&category=%5C%28selectedCategory%29&page=2"
            },
            "brands": [
                {
                    "id": 643,
                    "name": "YouGotaGift Happy Card",
                    "logo": "https://scdn.yougotagift.com/media/images/cards/fb/tmpgMJ64m.jpg",
                    "product_image": "https://scdn.yougotagift.com/media/cache/e6/17/e6171de0d7a173855a3d05e86f48d039.jpg",
                    "short_tagline": "One Card. All Brands. | Online+In-store",
                    "is_generic": true,
                    "seo_name": "yougotagift-com-gift-card",
                    "currency": "AED",
                    "detail_url": "https://emapi-sandbox.yougotagift.com/api/v3/brands/643/",
                    "redemption_tag": null,
                    "detail_url_v5": "https://emapi-sandbox.yougotagift.com/api/v3/brands/v5/643/"
                },
                {
                    "id": 1489,
                    "name": "YouGotaGift Ramadan Card",
                    "logo": "https://scdn.yougotagift.com/media/images/cards/fb/300x300_A5vmWHQ.jpg",
                    "product_image": "https://scdn.yougotagift.com/media/cache/ba/82/ba827d08974455519e8f41d9086ed0a6.jpg",
                    "short_tagline": "One Card. All Brands. | Online+In-store",
                    "is_generic": true,
                    "seo_name": "ygag-ramadan-card-ae",
                    "currency": "AED",
                    "detail_url": "https://emapi-sandbox.yougotagift.com/api/v3/brands/1489/",
                    "redemption_tag": "Online Friendly",
                    "detail_url_v5": "https://emapi-sandbox.yougotagift.com/api/v3/brands/v5/1489/"
                }
            ],
            "categories": [
                {
                    "id": 32,
                    "name": "Most Popular",
                    "seo_name": "most-popular",
                    "image_large": "https://scdn.yougotagift.com/media/cache/e6/cd/e6cd6f0901f2d67e7028723c46ac635d.jpg",
                    "image_small": "https://scdn.yougotagift.com/media/cache/e3/46/e3467a3f39cf48808aa8dd6909ffcbbe.jpg",
                    "title": "Send eGift Cards from home",
                    "caption": "",
                    "default_display": true,
                    "bg_color_code": "#BC927E",
                    "tag_type": "Category",
                    "icon_image": ""
                },
                {
                    "id": 117,
                    "name": "Online Friendly",
                    "seo_name": "Online-Friendly",
                    "image_large": "https://scdn.yougotagift.com/media/cache/9f/bb/9fbb5406ce5a0bec9e798b790ba910c5.jpg",
                    "image_small": "https://scdn.yougotagift.com/media/cache/ae/76/ae761f7f59b524657e3a6a88667c0163.jpg",
                    "title": "Online Friendly eGift Cards",
                    "caption": "",
                    "default_display": false,
                    "bg_color_code": "#e199b8",
                    "tag_type": "Category",
                    "icon_image": "https://scdn.yougotagift.com/media/tags/48/484cff51-6db4-446c-9747-53dad2905521.png"
                }
            ]
        }
        """
        let data = jsonString.data(using: .utf8)
        if let data = data,
           let filmSummary = try? JSONDecoder().decode(HomeModel.self, from: data) {
            completionHandler(filmSummary)
        } else {
            completionHandler(nil)
        }
        
    }
    
}
