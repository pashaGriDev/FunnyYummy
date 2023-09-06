//
//  PageViewModel.swift
//  CookbookExample
//
//  Created by Kasharin Mikhail on 26.08.2023.
//

import Foundation

class PageViewModel: ObservableObject {
    
    @Published var pages: [OnboardingPage] = []
    @Published var currentPage: Int = 0
    
    init() {
        pages = OnboardingPage.pages
    }
}
