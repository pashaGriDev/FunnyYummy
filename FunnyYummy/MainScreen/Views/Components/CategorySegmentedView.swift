//
//  CategorySegmentedView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct CategorySegmentedView: View {
    
    let array = ["Salad", "Appetizer", "Breakfast", "Noodle", "Lunch", "Dinner"]
    @State private var choiceCategory = "Salad"
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(array, id: \.self) { category in
                    Text(category)
                        .foregroundColor(
                            category == choiceCategory
                            ? .white
                            : .red
                        )
                        .padding(.all, 10)
                        .background(
                            category == choiceCategory
                            ? Color.buttonColor
                            : Color.clear
                        )
                        .cornerRadius(10)
                        .onTapGesture {
                            choiceCategory = category
                        }
                }
            }
        }
    }
}

struct CategorySegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySegmentedView()
    }
}
