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
    
    public var allGenre: [HomeGenre] = [.AllGenres, .Action, .Comedy, .Horror, .Thriller]
    
    public func getMovie(_ category: String, andHomeRow homeRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
        
        switch homeRow {
        case .home:
            return movies[category] ?? []
        case .movies:
            return (movies[category] ?? []).filter {
                $0.movieType == .movie && $0.genre == genre
            }
        case .tvShows:
            return (movies[category] ?? []).filter {
                $0.movieType == .tvShow && $0.genre == genre
            }
        case .myList:
            return movies[category] ?? []
        }
    }

    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci"] = exampleMovies.shuffled()        
    }
}
