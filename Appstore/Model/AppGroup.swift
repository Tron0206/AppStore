//
//  AppGroup.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 17/05/2022.
//

import Foundation


struct AppGroup: Decodable {
    var feed: Feed
}

struct Feed: Decodable {
    var title: String
    var results: [FeedResult]
}

struct FeedResult: Decodable {
    let name, artistName, artworkUrl100: String
}
