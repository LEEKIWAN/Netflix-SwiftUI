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
    
    var imageName: String {
        isOn ? isOnImage : isOffImage
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallVerticalButton(text: "My List", isOnImage: <#String#>, isOffImage: <#String#>, isOn: <#Bool#>)
    }
}
