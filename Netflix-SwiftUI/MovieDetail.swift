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
                        
                        if let promotionHeadline =  movie.promotionHeadline {
                            Text(promotionHeadline)
                        }
                        
                        PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                            
                        }
                        
                        CurrentEpisodeInfoView(movie: movie)
                        CastInfoView(movie: movie)
                        
                        HStack(spacing: 40) {
                            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                
                            }
                            
                            SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup.fill", isOn: true) {
                                
                            }
                            
                            SmallVerticalButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        CustomTapSwitcher(tabs: [.episodes, .trailers, .more])
                        
                    }
                    .padding(.horizontal, 10)
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie2)
    }
}

struct MovieInfoSubHeadline: View {
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 20.0) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            RatingView(rating: movie.rating)
                
            
            Text(movie.numberOfSeasonsDisplay)
        }
        .padding(.vertical, 6.0)
        .foregroundColor(.gray)
    }
}

struct RatingView: View {
    var rating: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20, alignment: .center)
    }
}

struct CastInfoView: View {
    var movie: Movie
    
    var body: some View {
        VStack(spacing: 3.0) {
            HStack {
                Text("Cast: \(movie.cast)")
                Spacer()
            }
            
            HStack {
                Text("Creators: \(movie.creators)")
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 10)
    }
}

struct CurrentEpisodeInfoView: View {
    var movie: Movie
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                Spacer()
            }
            .padding(.vertical, 4)
            
            Text(movie.episodeDescriptionDisplay)
                .font(.subheadline)
        }
    }
}
