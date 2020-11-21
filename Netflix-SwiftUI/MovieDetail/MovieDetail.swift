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
    
    
    @State var showSeasonPicker = false
    @State var selectedSeason = 1
    
    @Binding var movieDetailToShow: Movie?
    
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        movieDetailToShow = nil
                    }, label: {
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
                        
                        HStack(spacing: 50) {
                            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                
                            }
                            
                            SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup.fill", isOn: true) {
                                
                            }
                            
                            SmallVerticalButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
//                        CustomTapSwitcher(tabs: [.episodes, .trailers, .more], movie: movie)
//                            .padding(.top, 20)
                        
                        CustomTapSwitcher(showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason, tabs: [.episodes, .trailers, .more], movie: movie)
                            .padding(.top, 20)
                        
                        
                    }
                    .padding(.horizontal, 10)
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            
            if showSeasonPicker {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40.0) {
                        Spacer()
                        
                        ForEach(0 ..< (movie.numberOfSeasons ?? 0)) { season in
                            Button(action: {
                                self.selectedSeason = season + 1
                                self.showSeasonPicker = false
                            }, label: {
                                Text("Season \(season + 1)")
                                    .foregroundColor(selectedSeason == season + 1 ? .white : .gray)
                                    .bold()
                                    .font(selectedSeason == season + 1 ? .title : .title2)
                            })
                        }
                        
                        Spacer()
                        
                        
                        Button(action: {
                            self.showSeasonPicker = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .scaleEffect(x: 1.1)
                        })
                        .padding(.bottom, 30)
                    }
                    
                }
            }
            
            
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie1, movieDetailToShow: .constant(nil))
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
