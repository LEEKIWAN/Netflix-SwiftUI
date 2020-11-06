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
    
    var body: some View {
        
        GeometryReader(content: { geometry in
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(showsIndicators: false) {
                    VStack {                 // LAZYVSTACK
                        ZStack(alignment: .top) {
                            TopMoviePreview(movie: exampleMovie1)

                            TopRowButton()
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
                                        }
                                    }
                                })
                            }
                        }
                    }
                }
                .edgesIgnoringSafeArea(.top)
                
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
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            })
            
            
            Spacer()
            Button(action: {}, label: {
                Text("TV Shows")
            })
            
            Spacer()
            Button(action: {}, label: {
                Text("Movies")
            })
            
            Spacer()
            Button(action: {}, label: {
                Text("My List")
            })
        }
//        .background(Color.black)
        .padding(.trailing, 30)
        .padding(.leading, 10)
    }
}
