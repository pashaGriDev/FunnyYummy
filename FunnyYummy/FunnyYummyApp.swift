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
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
    }
}
