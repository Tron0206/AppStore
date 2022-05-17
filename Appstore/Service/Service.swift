//
//  Service.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 11/05/2022.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completionHandler: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
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
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> Void) {
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data)
                completion(appGroup, nil)
            } catch let JSONError {
                print("Failing to decode \(JSONError)")
            }
        }.resume()
    }



}


