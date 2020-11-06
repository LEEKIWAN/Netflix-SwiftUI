//
//  MovieDetail.swift
//  Netflix-SwiftUI
//
//  Created by kiwan on 2020/11/06.
//

import SwiftUI

struct MovieDetail: View {
    
    let screen = UIScreen.main.bounds
    
    var movie: Movie
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    })
                }
                .padding(.horizontal, 22)
                
                ScrollView {
                    VStack {
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5)
                                                
                        MovieInfoSubHeadline(movie: movie)
                    }
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie3)
    }
}

struct MovieInfoSubHeadline: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            Image(systemName: "hand.thumbsup.fill")
            
            Text("MOVIE YEAR")
            Text("RATING")
            
            Text("seasons")
        }
        .padding(.vertical, 6)
        .foregroundColor(.gray)
    }
}
