//
//  PageIndicatorView.swift
//  CookbookExample
//
//  Created by Kasharin Mikhail on 26.08.2023.
//

import SwiftUI

struct PageIndicatorView: View {
    
    let pages: [OnboardingPage]
    let currentPage: Int
    
    var body: some View {
        HStack {
            ForEach(pages.indices, id: \.self) { index in
                Capsule()
                    .fill(currentPage == index ? .red : .gray)
                    .frame(width: 50, height: 10)
            }
        }
    }
}

struct PageIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicatorView(pages: OnboardingPage.pages, currentPage: 1)
    }
}
