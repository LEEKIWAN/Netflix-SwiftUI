//
//  HomeView.swift
//  Netflix
//
//  Created by 이기완 on 2020/11/01.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeVM()
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
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
            
            
        }
        .foregroundColor(.white)
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
