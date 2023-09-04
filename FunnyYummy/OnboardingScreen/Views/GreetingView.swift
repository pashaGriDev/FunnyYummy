//
//  GreetingView.swift
//  CookbookExample
//
//  Created by Kasharin Mikhail on 26.08.2023.
//

import SwiftUI

import SwiftUI

struct GreetingView: View {
    
    @Binding var isOnboardingDone: Bool
    
    var body: some View {
        ZStack {
            BackgroundImage()
            VStack {
                TopContent()
                Spacer()
                GreetingContent(isOnboardingDone: $isOnboardingDone)
                    .padding(.bottom, 50)
            }
            .foregroundColor(Color.Text.white)
        }
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(isOnboardingDone: .constant(false))
    }
}
