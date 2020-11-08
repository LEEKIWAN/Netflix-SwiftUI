//
//  Movie.swift
//  Netflix-SwiftUI
//
//  Created by 이기완 on 2020/11/01.
//

import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var episodes: [Episode]?
    
    var promotionHeadline: String?
    
    var numberOfSeasonsDisplay: String {
        if let numberOfSeasons = numberOfSeasons {
            return "\(numberOfSeasons) seasons"
        }
        
        return ""
    }
}


struct CurrentEpisodeInfo: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}
