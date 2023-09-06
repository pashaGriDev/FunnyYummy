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
        Image(systemName: "bookmark")
            .foregroundColor(isSelected ? Color.Button.red : Color.Button.gray)
            .padding(.all, 6)
            .background(
                Circle()
                    .fill(dataProvider.ids.contains(id)
                          ? Color.Button.red.opacity(0.2)
                          : Color.Main.white)
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
