//
//  ViewRouter.swift
//  FunnyYummy
//
//  Created by dsm 5e on 29.08.2023.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .main
    
}

enum Page {
    case main
    case favorites
    case notifications
    case profile
}
