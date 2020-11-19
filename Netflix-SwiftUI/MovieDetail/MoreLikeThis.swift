//
//  MoreLikeThis.swift
//  Netflix-SwiftUI
//
//  Created by kiwan on 2020/11/15.
//

import SwiftUI

struct MoreLikeThis: View {
    var movies: [Movie]
    
    var columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            
            ForEach(movies) { movie in
                StandardHomeMovie(movie: movie)
                
            }
        }
    }
}

struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThis(movies: exampleMovies)
    }
}
