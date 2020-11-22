//
//  HomeStack.swift
//  Netflix-SwiftUI
//
//  Created by kiwan on 2020/11/22.
//

import SwiftUI

struct HomeStack: View {
    var vm: HomeVM
    
    var topRowSelection: HomeTopRow
    var selectedGenre: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
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
                        ForEach(vm.getMovie(cateogry, andHomeRow: topRowSelection, andGenre: selectedGenre)) { movie in
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

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                HomeStack(vm: HomeVM(), topRowSelection: .movies, selectedGenre: .AllGenres, movieDetailToShow: .constant(nil))
            }
            
        }
        .foregroundColor(.white)
    }
}
