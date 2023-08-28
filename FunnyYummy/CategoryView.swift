//
//  CategoryView.swift
//  FunnyYummy
//
//  Created by Никита Мартьянов on 28.08.23.
//
import SwiftUI

struct CategoryView: View {
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    ForEach(1..<10) { _ in
                        VStack {
                            AsyncImage(url:URL(string: "https://spoonacular.com/recipeImages/716429-312x231.jpg")) {
                                phase in
                                switch phase {
                                case let .success (image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 350, height: 200)
                                        .background(Color.gray.opacity(0.3).cornerRadius(24))
                                        .overlay(
                                            Rectangle()
                                                .frame(height: 50)
                                                .foregroundColor(.clear),
                                            alignment: .top
                                        )
                                case .empty :
                                    ProgressView()
                                default :
                                    Image(systemName: "circle")
                                }
                            }
                                /*.overlay(
                                    VStack(alignment: .leading) {
                                        Text("How to make yam & vegetable sauce at home")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        
                                        Text("9 ingredients | 25 min")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                            .opacity(0.7)
                                    }
                                        .padding(),
                                    alignment: .bottom
                                )*/
                        }
                    }
                }
            }
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



