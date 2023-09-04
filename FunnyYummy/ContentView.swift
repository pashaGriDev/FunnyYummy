//
//  ContentView.swift
//  FunnyYummy
//
//  Created by Павел Грицков on 27.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .main:
                    MainScreenView()
                case .favorites:
                    FavoriteScreenView()
                case .notifications:
                    Text("NOTIFICATION PAGE")
                case .profile:
                    ProfileView()
                }
                Spacer()
                TabBar(viewRouter: viewRouter, proxy: proxy)
            }
            .environmentObject(DataProvider())
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(viewRouter: ViewRouter())
        }
    }
}
