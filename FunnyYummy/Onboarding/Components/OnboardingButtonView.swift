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
    
    // Вычисляемое свойство для последней страницы
    var lastPage: Int {
        return vm.pages.count - 1
    }
    
    // Константы
    let skipButtonHeight: CGFloat = 30
    let cornerRadius: CGFloat = 15
    
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    if currentPage != lastPage {
                        currentPage += 1
                    } else {
                        isOnboarding.toggle()
                    }
                }
            } label: {
                Text(currentPage != lastPage ? "Continue" : "Start cooking")
                    .font(.title)
                    .foregroundColor(Color.Text.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.Button.red)
                    .cornerRadius(cornerRadius)
            }
            .padding(.horizontal)
            
            Button {
                isOnboarding.toggle()
            } label: {
                Text(currentPage != lastPage ? "Skip" : "")
                    .font(.title3)
                    .foregroundColor(Color.Text.white)
                    .frame(height: skipButtonHeight)
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
