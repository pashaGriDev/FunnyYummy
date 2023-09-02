//
//  GreetingView.swift
//  CookbookExample
//
//  Created by Kasharin Mikhail on 26.08.2023.
//

import SwiftUI

struct GreetingView: View {
    
    @Binding var isOnboardingDone: Bool
    
    var body: some View {
        ZStack {
            Image("Onboarding")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .scaleEffect(1.2)
            
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                    Text("100k Premium recipes")
                        .foregroundColor(.white)
                }
                .padding(.top, 50)
                
                Spacer()
                
                VStack(spacing: 30) {
                    Text("Best\nRecipe")
                        .font(.system(size: 48, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Find best recipe for cooking")
                        .foregroundColor(.white)
                    
                    Button {
                        withAnimation(.easeInOut) {
                            isOnboardingDone.toggle()
                        }
                    } label: {
                        Text("Get started")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.red)
                            .cornerRadius(15)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 70)
            }
        }
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(isOnboardingDone: .constant(false))
    }
}
