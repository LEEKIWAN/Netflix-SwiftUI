//
//  SmallVerticalButton.swift
//  Netflix-SwiftUI
//
//  Created by 이기완 on 2020/11/04.
//

import SwiftUI

struct SmallVerticalButton: View {
    var text: String
    var isOnImage: String
    var isOffImage: String
    
    var isOn: Bool
    
    var action: () -> ()
    
    var imageName: String {
        isOn ? isOnImage : isOffImage
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack(spacing: 8.0) {
                Image(systemName: imageName)
                Text(text)
                    .font(.system(size: 14))
                    .bold()
            }
            .foregroundColor(.white)
        })
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: false) {
                print("Tapped")
            }
        }
    }
}
