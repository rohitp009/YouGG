//
//  HomeResource.swift
//  YouGG
//
//  Created by Rohit Kumar on 02/05/21.
//

import Foundation

protocol HomeResourceProtocol: class {
    func fetchGifts(selectedCategory: Int,completionHandler: @escaping (HomeModel?) -> Void)
}

class HomeResource: HomeResourceProtocol {
        
    func fetchGifts(selectedCategory: Int,completionHandler: @escaping (HomeModel?) -> Void) {
        
        let url = URL(string: "https://emapi-sandbox.yougotagift.com/uae/api/v3/brands/featured/?api_key=2vq1M9ye4eV6H1Mr&api_secret=wnRY14QoA99B4Ae6wn2CU2y8&category=\(selectedCategory)&page=1")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            
            if let data = data,
               let filmSummary = try? JSONDecoder().decode(HomeModel.self, from: data) {
                completionHandler(filmSummary)
            } else {
                completionHandler(nil)
            }
        })
        task.resume()
    }
}
