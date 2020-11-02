//
//  HomeVM.swift
//  Netflix-SwiftUI
//
//  Created by 이기완 on 2020/11/01.
//

import Foundation

class HomeVM: ObservableObject {
    
    // String == Category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        movies.keys.map {
            String($0)
        }
    }
    
    
    //MARK: - Func
    
    init() {
        setupMovies()
    }
    
    public func getMovie(_ category: String) -> [Movie] {
        movies[category] ?? []
    }

    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci"] = exampleMovies.shuffled()        
    }
}
