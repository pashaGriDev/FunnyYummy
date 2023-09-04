//
//  GreetingContent.swift
//  FunnyYummy
//
//  Created by dsm 5e on 03.09.2023.
//

import SwiftUI

struct GreetingContent: View {
    @Binding var isOnboardingDone: Bool

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Text("Best\nRecipe")
                .font(.system(size: 48, weight: .black, design: .serif))
                .multilineTextAlignment(.center)

            Text("Find best recipe for cooking")
            Spacer()
            Button {
                withAnimation(.easeInOut) {
                    isOnboardingDone.toggle()
                }
            } label: {
                Text("Get started")
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.Button.red)
                    .cornerRadius(15)
            }
            .padding(.horizontal)
        }
    }
}
