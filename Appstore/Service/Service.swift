//
//  Service.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 11/05/2022.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(completionHandler: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completionHandler([], nil)
                return
            }
            
            guard let data = data else { return }

            
            do {
                let appResults = try JSONDecoder().decode(SearchResult.self, from: data)
                completionHandler(appResults.results, nil)
            } catch let jsonError {
                print("Failed to decode json: \(jsonError)")
                completionHandler([], jsonError)
            }
        }.resume()
    }



}


