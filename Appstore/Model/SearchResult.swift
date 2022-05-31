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
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
    var formattedPrice: String?
    let description: String
    var releaseNotes: String?
}
