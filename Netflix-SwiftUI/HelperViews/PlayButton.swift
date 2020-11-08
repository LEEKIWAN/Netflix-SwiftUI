//
//  WhiteButton.swift
//  Netflix-SwiftUI
//
//  Created by kiwan on 2020/11/05.
//

import SwiftUI

struct PlayButton: View {
    
    var text: String
    var imageName: String
    
    var backgroundColor: Color = .white
    
    var action: () -> ()

    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            HStack {
                Spacer()
                Image(systemName: imageName)
                    .font(.headline)
                
                Text(text)
                    .bold()
                    .font(.system(size: 16))
                Spacer()
            }
            .padding(.vertical, 6)
            .foregroundColor(backgroundColor == .white ? .black : .white)
            .background(backgroundColor)
            .cornerRadius(3.0)
        })
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PlayButton(text: "Play", imageName: "play.fill") {
                print("D")
            }
        }
    }
}
