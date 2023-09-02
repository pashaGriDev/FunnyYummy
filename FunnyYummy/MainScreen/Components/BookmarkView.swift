//
//  BookmarkView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct BookmarkView: View {
    
    @State private var isSelected = false
    
    var body: some View {
        Image(systemName: "bookmark")
            .foregroundColor(isSelected ? .prymary50 : .gray)
            .padding(.all, 6)
            .background(
                Circle()
                    .fill(isSelected
                          ? Color.prymary50.opacity(0.2)
                          : Color.white)
            )
            .onTapGesture {
                isSelected.toggle()
            }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}
