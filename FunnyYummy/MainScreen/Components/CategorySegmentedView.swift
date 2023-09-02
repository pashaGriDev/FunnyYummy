//
//  CategorySegmentedView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct CategorySegmentedView: View {
    
    let dishTypes: [DishTypes] = DishTypes.allCases
    @ObservedObject var vm: MainScreenViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(dishTypes, id: \.self) { type in
                    Text(type.rawValue.capitalized)
                        .foregroundColor(
                            type == vm.dishType
                            ? .white
                            : .buttonColor
                        )
                        .padding(.all, 10)
                        .background(
                            type == vm.dishType
                            ? Color.buttonColor
                            : Color.clear
                        )
                        .cornerRadius(10)
                        .onTapGesture {
                            vm.dishType = type
                            Task {
                                await vm.fetchDishTypeRecipe()
                            }
                        }
                }
            }
        }
    }
}

struct CategorySegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySegmentedView(vm: MainScreenViewModel())
    }
}
