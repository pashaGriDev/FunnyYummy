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
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(1..<10) { _ in
                        VStack {
                            AsyncImage(url:URL(string: "https://spoonacular.com/recipeImages/716429-312x231.jpg")) {
                                phase in
                                switch phase {
                                case let .success (image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .overlay(
                                            Rectangle()
                                                .frame(width: 40, height: 30)
                                                .foregroundStyle(.ultraThinMaterial)
                                                .offset(x: 20, y: 40)
                                                ,
                                            alignment: .topLeading
                                        )
                                        .overlay(
                                            VStack(alignment: .leading, spacing: 10) {
                                                Text("How to make yam & vegetable sauce at home")
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                                
                                                Text("9 ingredients | 25 min")
                                                    .font(.subheadline)
                                                    .foregroundColor(.white)
                                                    .opacity(0.7)
                                            }
                                                .padding(.bottom, 40),
                                            alignment: .bottom
                                        )
                                case .empty :
                                    ProgressView()
                                default :
                                    Image(systemName: "circle")
                                }
                            }
                            .frame(width: 350, height: 200)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(24)
                            .clipped()
                            
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



