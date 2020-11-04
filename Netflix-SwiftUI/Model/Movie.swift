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
}
