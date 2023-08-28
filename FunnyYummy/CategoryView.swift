//
//  CategoryView.swift
//  FunnyYummy
//
//  Created by Никита Мартьянов on 28.08.23.
//
import SwiftUI

struct CategoryView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        
                        Button(action: {
                            // Действия при нажатии на кнопку назад
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                        }
                        
                        
                        Spacer()
                        Text("Trending now")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {
                            // Действия при нажатии на кнопку с тремя точками
                        }) {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        ForEach(1..<10) { _ in
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 350, height: 200)
                                    .background(Color.gray.opacity(0.3).cornerRadius(24))
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 50) // Высота свободного пространства вверху
                                            .foregroundColor(.clear),
                                        alignment: .top
                                    )
                                    .overlay(
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
                                        alignment: .bottom // Текст отображается внизу картинки
                                    )
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}



