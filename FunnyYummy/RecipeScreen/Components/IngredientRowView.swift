//
//  IngredientRowView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct IngredientRowView: View {
    
    let url: String
    let text: String
    @State private var isSelected = false
    
    var body: some View {
        HStack(spacing: 20) {
            ImageLoaderView(url: url)
                .frame(width: 52, height: 52)
            Text(text)
                .font(.system(size: 16).bold())
                .lineLimit(1)

            Spacer(minLength: 0)
            Text("250g")
                .foregroundColor(.gray)
                .font(.system(size: 14))
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .foregroundColor(isSelected ? .buttonColor : .black)
                .frame(width: 23, height: 23)
        }
        .frame(height: 76)
        .onTapGesture {
            isSelected.toggle()
        }
        .padding(.horizontal)
        .background(Color.gray.opacity(0.2).cornerRadius(10))
    }
}

struct IngredientRowView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientRowView(url: "https://cdn-icons-png.flaticon.com/512/2005/2005849.png", text: "Vegetable oil")
    }
}
