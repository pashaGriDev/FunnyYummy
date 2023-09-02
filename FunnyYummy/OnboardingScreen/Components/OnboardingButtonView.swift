//
//  OnboardingButtonView.swift
//  CookbookExample
//
//  Created by Kasharin Mikhail on 26.08.2023.
//

import SwiftUI

struct OnboardingButtonView: View {
    
    @StateObject var vm: PageViewModel
    @Binding var isOnboarding: Bool
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    if currentPage != vm.pages.count - 1 {
                        currentPage += 1
                    } else {
                        isOnboarding.toggle()
                    }
                }
            } label: {
                Text(currentPage != vm.pages.count - 1 ? "Continue" : "Start cooking")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.red)
                    .cornerRadius(15)
            }
            .padding(.horizontal)
            
            Button {
                isOnboarding.toggle()
            } label: {
                Text(currentPage != vm.pages.count - 1 ? "Skip" : "")
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(height: 30)
            }
        }
    }
}

struct OnboardingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                OnboardingButtonView(vm: PageViewModel(), isOnboarding: .constant(true), currentPage: .constant(0))
                
                OnboardingButtonView(vm: PageViewModel(), isOnboarding: .constant(false), currentPage: .constant(2))
            }
        }
    }
}
