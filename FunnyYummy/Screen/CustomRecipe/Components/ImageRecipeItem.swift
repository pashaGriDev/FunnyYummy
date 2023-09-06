//
//  ImageRecipeItem.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 06.09.2023.
//

import SwiftUI

struct ImageRecipeItem: View {
    
    @State private var isShowingPhotoPicker = false
    @State private var selectedDishImage: UIImage? = nil
    
    var body: some View {
        Group {
            if let image = selectedDishImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
            } else {
                Image(systemName: "fork.knife")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .overlay(
                        Image(systemName: "pencil")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.all, 8)
                            .background(
                                Color.white
                                    .clipShape(Circle())
                            )
                            .padding(.all, 10),
                        alignment: .topTrailing
                    )
            }
        }
        .sheet(isPresented: $isShowingPhotoPicker){
            PhotoPicker(avatarImage: $selectedDishImage)
        }
        .onTapGesture {
            isShowingPhotoPicker = true
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)

        .background(Color.gray.opacity(0.3).cornerRadius(24))
    }
}

struct ImageRecipeItem_Previews: PreviewProvider {
    static var previews: some View {
        ImageRecipeItem()
    }
}
