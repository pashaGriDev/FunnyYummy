//
//  RecipesCardView.swift
//  FunnyYummy
//
//  Created by dsm 5e on 30.08.2023.
//

import SwiftUI

struct RecipesCardView: View {
    
    @EnvironmentObject var dataProvider: DataProvider
    @Binding var recipe: CustomRecipeModel
    @Binding var isEditing: Bool

    var image: UIImage {
        return UIImage(data: recipe.image) ?? UIImage(systemName: "xmark")!
    }
    
    var body: some View {
        NavigationLink(destination: CustomRecipeView(recipe: recipe)){
            VStack {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 200)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .overlay(
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Spacer()
                            
                            Text(recipe.recipeName)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            
                            HStack {
                                Label(recipe.serves.formatted(), systemImage: "person.2.circle.fill")
                                Label("\(recipe.readyInMinutes)min", systemImage: "clock.fill")
                            }
                            .font(.subheadline.bold())
                            .opacity(0.7)
                        }
                            .foregroundColor(Color.Text.white)
                            .padding([.vertical, .leading]),
                        alignment: .topLeading
                    )
                    .overlay(
                        Image(systemName: isEditing ? "trash.circle" : "")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 30, height: 30)
                            .padding([.top, .trailing])
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.2)) {
                                    dataProvider.recipes.removeAll(where: { $0.id == recipe.id })
                                }
                                try? dataProvider.saveData(for: dataProvider.recipes, withKey: "treni3")
                            },
                        alignment: .topTrailing
                    )
            }
        }
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading).combined(with: .opacity).combined(with: .scale(scale: 0))))
    }
}

struct RecipesCardView_Previews: PreviewProvider {
    static let image = UIImage(systemName: "xmark")!.pngData()!
    static var previews: some View {
        RecipesCardView(
            recipe: .constant(CustomRecipeModel(
                id: 0,
                recipeName: "Shawarma at Home",
                image: image,
                serves: 2,
                readyInMinutes: 5,
                ingredients: [])),
            isEditing: .constant(true))
            .environmentObject(DataProvider())
    }
}

