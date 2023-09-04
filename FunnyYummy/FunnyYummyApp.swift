//
//  FunnyYummyApp.swift
//  FunnyYummy
//
//  Created by Павел Грицков on 27.08.23.
//

import SwiftUI

@main
struct FunnyYummyApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    @AppStorage("isOnboarding") var isOnboarding = false
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                ContentView(viewRouter: viewRouter)
                    .preferredColorScheme(.light)
            } else {
                PageControlView(isOnboarding: $isOnboarding)
            }
        }
        
    }
}
