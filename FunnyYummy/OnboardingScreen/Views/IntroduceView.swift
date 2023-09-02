//
//  IntroduceView.swift
//  CookbookExample
//
//  Created by Kasharin Mikhail on 26.08.2023.
//

import SwiftUI

struct IntroduceView: View {
    
    @ObservedObject var vm: PageViewModel
    @Binding var isOnboarding: Bool
    @Binding var currentPage: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Image("Onboarding\(currentPage.description)")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .scaleEffect(1.2)
            
            VStack(spacing: 30) {
                TabView(selection: $currentPage) {
                    ForEach(vm.pages.indices, id: \.self) { index in
                        AboutTextView(page: $vm.pages[index])
                    }
                }
                .frame(height: 180)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                PageIndicatorView(pages: vm.pages, currentPage: currentPage)
                
                OnboardingButtonView(vm: vm, isOnboarding: $isOnboarding, currentPage: $currentPage)
                
            }
            .padding(.bottom)
        }
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
    }
}

struct IntroduceView_Previews: PreviewProvider {
    static var previews: some View {
        IntroduceView(vm: PageViewModel(), isOnboarding: .constant(false), currentPage: .constant(2))
    }
}
