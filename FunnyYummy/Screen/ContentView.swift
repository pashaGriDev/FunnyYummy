//
//  ContentView.swift
//  FunnyYummy
//
//  Created by Павел Грицков on 27.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var createRecipe: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack {
                    switch viewRouter.currentPage {
                    case .main:
                        MainScreenView()
                    case .favorites:
                        FavoriteScreenView()
                    case .addRecipe:
                        CustomRecipeView()
                    case .notifications:
                        Text("NOTIFICATION PAGE")
                    case .profile:
                        ProfileView()
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    TabBar(viewRouter: viewRouter, proxy: proxy)
                }
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
