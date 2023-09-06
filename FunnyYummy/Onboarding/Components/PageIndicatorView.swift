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
    
    // Константы
    let capsuleWidth: CGFloat = 50
    let capsuleHeight: CGFloat = 10
    
    var body: some View {
        HStack {
            ForEach(pages.indices, id: \.self) { index in
                Capsule()
                    .fill(currentPage == index ? Color.Button.red : Color.Button.gray)
                    .frame(width: capsuleWidth, height: capsuleHeight)
            }
        }
    }
}

struct PageIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicatorView(pages: OnboardingPage.pages, currentPage: 1)
    }
}
