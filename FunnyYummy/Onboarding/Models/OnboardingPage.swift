//
//  OnboardingPage.swift
//  CookbookExample
//
//  Created by Kasharin Mikhail on 26.08.2023.
//

import Foundation

struct OnboardingPage: Identifiable {
    var id = UUID()
    var firstText: String
    var secondText: String
    var isSelected: Bool
    var image: String
    
    static let pages: [Self] = [
        OnboardingPage(firstText: "Recipes from\nall ", secondText: "over\nthe World", isSelected: true, image: "Onboarding2"),
        OnboardingPage(firstText: "Recipes with\n", secondText: "each and every\ndetail", isSelected: false, image: "Onboarding3"),
        OnboardingPage(firstText: "Cook it now or\n", secondText: "save it for later", isSelected: false, image: "Onboarding4")
    ]
}
