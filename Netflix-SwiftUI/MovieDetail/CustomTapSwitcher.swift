//
//  CustomTapSwitcher.swift
//  Netflix-SwiftUI
//
//  Created by kiwan on 2020/11/12.
//

import SwiftUI

struct CustomTapSwitcher: View {
    
    @State private var currentTab: CustomTab = .episodes
    
    @Binding var showSeasonPicker: Bool
    
    @Binding var selectedSeason: Int
    
    var tabs: [CustomTab]
    var movie: Movie
    
    
    func widthForTab(tab: CustomTab) -> CGFloat {
        return tab.rawValue.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        
        VStack {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(tabs, id: \.self) { tab in
                        
                        VStack {
                            Rectangle()
                                .frame(width: widthForTab(tab: tab), height: 6)
                                .foregroundColor(currentTab == tab ? .red : .clear)
                            
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                            })
                            .foregroundColor(currentTab == tab ? .white : .gray)
//                            .buttonStyle(PlainButtonStyle())
                            .frame(width: widthForTab(tab: tab), height: 30, alignment: .center)
                        }
                        
                    }
                }
                
            })
            
            switch currentTab {
            case .episodes:
                EpisodesView(episodes: movie.episodes ?? [], showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                
            case .trailers:
                TrailerList(trailers: movie.trailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeThisMovies)
            }
            
        }
        .foregroundColor(.white)
        
    }
}

enum CustomTab: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTapSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            CustomTapSwitcher(showSeasonPicker: .constant(false), selectedSeason: .constant(1), tabs: [.episodes, .trailers, .more], movie: exampleMovie1)
            
        }
        
    }
}
