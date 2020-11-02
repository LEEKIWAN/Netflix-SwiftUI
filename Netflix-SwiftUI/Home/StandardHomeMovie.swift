//
//  StandardHomeMovie.swift
//  Netflix-SwiftUI
//
//  Created by 이기완 on 2020/11/01.
//

import SwiftUI
import KingfisherSwiftUI

struct StandardHomeMovie: View {
    var movie: Movie
    
    var body: some View {
//        Text("Hello, World!")
        
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
    }
}
