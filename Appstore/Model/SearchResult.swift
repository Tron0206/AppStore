//
//  SearchResult.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 10/05/2022.
//

import Foundation


struct SearchResult: Decodable {
    var resultCount: Int
    var results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float
    let screenshotUrls: [String]
    let artworkUrl100: String
    let formattedPrice: String
    let description: String
    let releaseNotes: String
}
