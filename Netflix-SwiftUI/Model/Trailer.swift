//
//  Trailer.swift
//  Netflix-SwiftUI
//
//  Created by kiwan on 2020/11/16.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
    
}
