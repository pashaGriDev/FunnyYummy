//
//  PageViewExample.swift
//  CookbookExample
//
//  Created by Kasharin Mikhail on 26.08.2023.
//

import SwiftUI

struct PageControlView: View {
    
    @StateObject private var vm = PageViewModel()
    @State private var isOnboardingDone = true
    @State private var currentPage = 0
    @Binding var isOnboarding: Bool
    
    var body: some View {
        ZStack {
            if isOnboardingDone {
                GreetingView(isOnboardingDone: $isOnboardingDone)
            } else {
                IntroduceView(vm: vm, isOnboarding: $isOnboarding, currentPage: $currentPage)
            }
        }
    }
}

struct PageViewExample_Previews: PreviewProvider {
    static var previews: some View {
        PageControlView(isOnboarding: .constant(true))
    }
}
