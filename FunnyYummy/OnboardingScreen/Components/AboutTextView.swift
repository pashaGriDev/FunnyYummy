//
//  AboutTextView.swift
//  CookbookExample
//
//  Created by Kasharin Mikhail on 26.08.2023.
//

import SwiftUI

struct AboutTextView: View {
    
    @Binding var page: OnboardingPage
    
    // Константы
    let fontSize: CGFloat = 48
    let fontWeight: Font.Weight = .black
    let fontDesign: Font.Design = .serif
    let minimumScaleFactor: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            Group {
                Text(page.firstText)
                    .foregroundColor(Color.Text.white)
                +
                Text(page.secondText)
                    .foregroundColor(Color.Text.peach)
            }
            .padding(.horizontal)
            .font(.system(size: fontSize, weight: fontWeight, design: fontDesign))
            .minimumScaleFactor(minimumScaleFactor)
            .multilineTextAlignment(.center)
        }
    }
}

struct AboutTextView_Previews: PreviewProvider {
    static var previews: some View {
        AboutTextView(page: .constant(OnboardingPage(firstText: "Hello", secondText: "My friend", isSelected: false, image: "")))
            .preferredColorScheme(.dark)
    }
}
