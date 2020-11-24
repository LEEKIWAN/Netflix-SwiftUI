//
//  SearchBar.swift
//  Netflix-SwiftUI
//
//  Created by kiwan on 2020/11/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State private var isEditing = false
    
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width: 270, height: 36)
                .cornerRadius(8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.white)
                    .padding(.leading, 10)

                
                ZStack(alignment: .trailing) {
                    TextField("Search", text: $text)
                        .padding(7)

                        .background(Color.graySearchBackground)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .onTapGesture {
                            isEditing = true
                        }
                
                    if !text.isEmpty {
                        if isLoading {
                            ActivityIndicator(style: .medium, animate: .constant(true))
                                .configure {
                                    $0.color = .white
                                }
                                
                                .frame(width: 35, height: 35)
                        }
                        else {
                            Button(action: {
                                text = ""
                            }, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(Color.white)
                                    .frame(width: 35, height: 35, alignment: .center)
                            })
                        }
                    }
                }
                
                if isEditing {
                    Button(action: {
                        text = ""
                        isEditing = false
                        hideKeyboard()
                    }, label: {
                        Text("Cancel")
                    })
                    .foregroundColor(.white)
                    .padding(.trailing, 10)
                }
                
                
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SearchBar(text: .constant(""), isLoading: .constant(false))
                .padding()
        }
        
    }
}
