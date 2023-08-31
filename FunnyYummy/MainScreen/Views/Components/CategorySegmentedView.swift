//
//  CategorySegmentedView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct CategorySegmentedView: View {
    
    let dishTypes: [DishTypes] = DishTypes.allCases
    @Binding var choiceCategory: DishTypes

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(dishTypes, id: \.self) { type in
                    Text(type.rawValue.capitalized)
                        .foregroundColor(
                            type == choiceCategory
                            ? .white
                            : .buttonColor
                        )
                        .padding(.all, 10)
                        .background(
                            type == choiceCategory
                            ? Color.buttonColor
                            : Color.clear
                        )
                        .cornerRadius(10)
                        .onTapGesture {
                            choiceCategory = type
                        }
                }
            }
        }
    }
}

struct CategorySegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySegmentedView(choiceCategory: .constant(.mainCourse))
    }
}
