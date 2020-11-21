//
//  HomeView.swift
//  Netflix
//
//  Created by 이기완 on 2020/11/01.
//

import SwiftUI

struct HomeView: View {
    
    let screen = UIScreen.main.bounds
    
    var vm = HomeVM()
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .tvShows
    @State private var homeGenre: HomeGenre = .AllGenres
    
    var body: some View {
        
        GeometryReader(content: { geometry in
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(showsIndicators: false) {
                    VStack {                 // LAZYVSTACK
                        ZStack(alignment: .top) {
                            TopMoviePreview(movie: exampleMovie1)

                            TopRowButton(topRowSelection: $topRowSelection, homeGenre: $homeGenre)
                                .padding(.top, geometry.safeAreaInsets.top)
                                
                        }
                        
                        
                        
                        
                        ForEach(vm.allCategories, id: \.self) { cateogry in
                            VStack {
                                HStack {
                                    Text(cateogry)
                                        .font(.title3)
                                        .bold()
                                    Spacer()
                                }
                                
                                ScrollView(.horizontal, showsIndicators: false, content: {
                                    HStack {
                                        ForEach(vm.getMovie(cateogry)) { movie in
                                            StandardHomeMovie(movie: movie)
                                                .frame(width: 100, height: 150)
                                                .clipped()
                                                .padding(.horizontal, 2)
                                                .onTapGesture(perform: {
                                                    movieDetailToShow = movie
                                                })
                                        }
                                    }
                                })
                            }
                        }
                    }
                }
                .edgesIgnoringSafeArea(.top)
                
//                Color.blue
                
                if let movieDetailToShow = movieDetailToShow {
                    MovieDetail(movie: movieDetailToShow, movieDetailToShow: $movieDetailToShow)
                        .animation(.easeIn)
                        .transition(.identity)
                }
            }
            .foregroundColor(.white)
        })
        
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButton: View {
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    var body: some View {
        
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                
                
                Spacer()
                Button(action: {
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                
                Spacer()
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                
                Spacer()
                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
            }
            .padding(.trailing, 30)
            .padding(.leading, 10)
        case .myList, .tvShows, .movies:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                
                HStack(spacing: 20.0) {
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180))
                        }
                    })
                    
                    Button(action: {

                    }, label: {
                        Text("All Genres")
                    })
                    
                    Spacer()
                }
            }
            .padding(.trailing, 30)
            .padding(.leading, 10)
        default:
            EmptyView()
        }
        
    }
}


enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
    
}

enum HomeGenre {
    case AllGenres
    case Action
    case Comedy
    case Thriller
    
}
