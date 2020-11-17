//
//  GlobalHelpers.swift
//  Netflix-SwiftUI
//
//  Created by 이기완 on 2020/11/01.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!

let exampleImageURL = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!

var randomExampleImageURL: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL
}

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL)

let exampleTrailer2 = Trailer(name: "The Hero's Journey", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL2)

let exampleTrailer3 = Trailer(name: "The Mysterious", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL3)



let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]






let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "DARK",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                          categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2020, rating: "TV-MA",
                          numberOfSeasons: 1,
                          defaultEpisodeInfo: exampleEpisode1,
                          creators: "Baran bo Odan, Jantje Friesee",
                          cast: "Louis Hofmann, Oliver Masucci, jorids Tribel",
                          moreLikeThisMovies: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7],
                          trailers: exampleTrailers
)
let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Traveler",
                          thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2020, rating: "TV-MA",
                          numberOfSeasons: 2,
                          defaultEpisodeInfo: exampleEpisode1,
                          creators: "Baran bo Odan, Jantje Friesee",
                          cast: "Louis Hofmann, Oliver Masucci, jorids Tribel",
                          moreLikeThisMovies: [],
                          promotionHeadline: "Best Rated Show",
                          trailers: exampleTrailers
)
let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Community",
                          thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                          categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2020, rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisode1,
                          creators: "Baran bo Odan, Jantje Friesee",
                          cast: "Louis Hofmann, Oliver Masucci, jorids Tribel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers
)
let exampleMovie4 = Movie(id: UUID().uuidString,
                          name: "Alone",
                          thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                          categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2020, rating: "TV-MA",
                          numberOfSeasons: 4,
                          defaultEpisodeInfo: exampleEpisode1,
                          creators: "Baran bo Odan, Jantje Friesee",
                          cast: "Louis Hofmann, Oliver Masucci, jorids Tribel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers
)
let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Hannibal",
                          thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2020, rating: "TV-MA",
                          numberOfSeasons: 5,
                          defaultEpisodeInfo: exampleEpisode1,
                          creators: "Baran bo Odan, Jantje Friesee",
                          cast: "Louis Hofmann, Oliver Masucci, jorids Tribel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers
)
let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "After Life",
                          thumbnailURL: URL(string: "https://picsum.photos/200/305")!,
                          categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2020, rating: "TV-MA",
                          numberOfSeasons: 6,
                          defaultEpisodeInfo: exampleEpisode1,
                          creators: "Baran bo Odan, Jantje Friesee",
                          cast: "Louis Hofmann, Oliver Masucci, jorids Tribel",
                          moreLikeThisMovies: [], promotionHeadline: "Watch Season 6 Now",
                          trailers: exampleTrailers
)

let exampleMovie7 = Movie(id: UUID().uuidString,
                          name: "After Life",
                          thumbnailURL: URL(string: "https://picsum.photos/200/306")!,
                          categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2020, rating: "TV-MA",
                          numberOfSeasons: 6,
                          defaultEpisodeInfo: exampleEpisode1,
                          creators: "Baran bo Odan, Jantje Friesee",
                          cast: "Louis Hofmann, Oliver Masucci, jorids Tribel",
                          moreLikeThisMovies: [], promotionHeadline: "Watch Season 6 Now",
                          trailers: exampleTrailers
)


let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]


let exampleEpisode1 = CurrentEpisodeInfo(episodeName: "Beginnings and Endings", description: "Six months after the disapperance, the police form a task force. In 2052, jonas learns that most of winden perished in an apocaltypic event. ", season: 2, episode: 1)

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.9)]), startPoint: .top, endPoint: .bottom)
}


extension String { 
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
    
}
