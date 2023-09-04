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
            .foregroundColor(isSelected ? Color.Button.red : Color.Button.gray)
            .padding(.all, 6)
            .background(
                Circle()
                    .fill(isSelected
                          ? Color.Button.red.opacity(0.2)
                          : Color.Main.white)
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
