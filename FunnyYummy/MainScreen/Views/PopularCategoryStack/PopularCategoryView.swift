//
//  PopularCategoryView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 28.08.2023.
//

import SwiftUI

struct PopularCategoryView: View {
    let array = ["Salad", "Appetizer", "Breakfast", "Noodle", "Lunch", "Dinner"]
    var body: some View {
        // TODO: - Popular category
        VStack(alignment: .leading, spacing: 10) {
            HeaderTitleView(title: "Popular category", hasNavigationLink: false)
            
            CategorySegmentedView()
            
            PopularCategoryItem()
            
        }
    }
}

struct PopularCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        PopularCategoryView()
    }
}
