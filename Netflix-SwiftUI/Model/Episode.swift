//
//  Episode.swift
//  Netflix-SwiftUI
//
//  Created by 이기완 on 2020/11/08.
//

import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString
    var name: String
    
    var season: Int
    
    var thumbnailImageURLString: String
    var description: String
    
    var length: Int
    
    var thumbnailURL: URL {
        URL(string: thumbnailImageURLString)!
    } 
}
