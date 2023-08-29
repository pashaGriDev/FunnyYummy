//
//  CategoryView.swift
//  FunnyYummy
//
//  Created by Никита Мартьянов on 28.08.23.
//
import SwiftUI

struct CategoryView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(1..<10) { _ in
                    CategoryViewCell(
                        imageURL: "https://spoonacular.com/recipeImages/716429-312x231.jpg",
                        title: "How to make yam & vegetable sauce at home",
                        details: "9 ingredients | 25 min"
                    )
                }
            }
            .padding(.top, 20)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Trending now")
                    .font(.title.bold())
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    //
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.black)
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryView()
        }
    }
}
