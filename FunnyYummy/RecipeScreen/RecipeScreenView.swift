//
//  RecipeScreenView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct RecipeScreenView: View {
    
    let instruction = [
        "Place eggs in a saucepan and cover with cold water. Bring water to a boil and immediately remove from heat. Cover and let eggs stand in hot water for 10 to 12 minutes. Remove from hot water, cool, peel, and chop.",
        "Place chopped eggs in a bowl.",
        "Add chopped tomatoes, corns, lettuce, and any other vegitable of your choice.",
        "Stir in mayonnaise, green onion, and mustard. Season with paprika, salt, and pepper."
    ]
    
    let ingredients = [
        "Fish",
        "Ginger",
        "Vegetable oil",
        "Solt",
        "Cucumber"
    ]
    
    let urls = [
        "https://cdn-icons-png.flaticon.com/512/528/528320.png",
        "https://cdn1.iconfinder.com/data/icons/fruits-vegetables-color-2/128/ginger-color-512.png",
        "https://cdn-icons-png.flaticon.com/512/2005/2005849.png",
        "https://cdn-icons-png.flaticon.com/512/736/736923.png",
        "https://cdn4.iconfinder.com/data/icons/farm-12/512/Cucumber-1024.png"
    ]
    
    let url = "https://spoonacular.com/recipeImages/716429-312x231.jpg"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("How to make Tasty Fish (point & Kill)")
                .font(.title.bold())
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    // TODO: Picture Stack
                    VStack(alignment: .leading) {
                        ImageLoaderView(url: url)
                            .frame(
                                width: UIScreen.main.bounds.width - 32, height: 200)
                            .background(
                                Color.gray.opacity(0.3)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        HStack {
                            Label("4.5", systemImage: "star.fill")
                            Text("(300 Reviews)")
                                .foregroundColor(.gray)
                        }
                        .font(.system(size: 14))
                    }
                    //TODO: Instructions Stack
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Instructions")
                                .font(.title3.bold())
                            Spacer()
                        }
                        
                        ForEach(instruction.indices, id: \.self) { index in
                            HStack (alignment: .firstTextBaseline){
                                Text("\(index + 1).")
                                Text(instruction[index])
                            }
                            .font(.system(size: 18))
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Ingredients")
                                .font(.title3.bold())
                            Spacer()
                        }
                        
                        VStack(spacing: 12) {
                            ForEach(ingredients.indices, id: \.self) { index in
                                IngredientRowView(url: urls[index], text: ingredients[index])
                            }
                        }
                    }
                }
                }

        }
        .padding([.horizontal, .top])
    }
}

struct RecipeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeScreenView()
    }
}
