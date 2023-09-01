//
//  AboutTextView.swift
//  CookbookExample
//
//  Created by Kasharin Mikhail on 26.08.2023.
//

import SwiftUI

struct AboutTextView: View {
    
    @Binding var page: OnboardingPage
    
    var body: some View {
        ZStack {
            Group {
                Text(page.firstText)
                + Text(page.secondText)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .font(.system(size: 48, weight: .black, design: .rounded))
            .minimumScaleFactor(0.5)
            .foregroundColor(.white)
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
