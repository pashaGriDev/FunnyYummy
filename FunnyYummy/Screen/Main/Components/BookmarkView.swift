//
//  BookmarkView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct BookmarkView: View {
    let id: Int
    @State private var isSelected = false
    @EnvironmentObject var dataProvider: DataProvider
    
    var body: some View {
        Image(systemName: dataProvider.ids.contains(id)
              ? "bookmark.fill"
              : "bookmark"
        )
        .foregroundColor(dataProvider.ids.contains(id)
                         ? Color.Button.red
                         : Color.Button.gray
        )
        .padding(.all, 6)
        .background(
            Circle()
                .fill(Color.Main.white.opacity(0.8))
        )
        .onTapGesture {
            if dataProvider.ids.contains(id) {
                dataProvider.ids.removeAll(where: { $0 == id })
            } else {
                dataProvider.ids.append(id)
            }
            try? dataProvider.saveData(for: dataProvider.ids, withKey: "ID")
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static let recipe = mokRandomRecip
    static var previews: some View {
        BookmarkView(id: 100)
            .environmentObject(DataProvider())
    }
}
