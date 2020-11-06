//
//  TestView.swift
//  Netflix-SwiftUI
//
//  Created by kiwan on 2020/11/06.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                List {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        // do something
                    }){
                        Text("Button")
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .padding(.bottom, proxy.safeAreaInsets.bottom)
                    Spacer()
                }.background(Color.blue)
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
    
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
