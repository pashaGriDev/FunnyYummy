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
                    Text("MAIN PAGE")
                case .favorites:
                    Text("FAVORITES PAGE")
                case .notifications:
                    Text("NOTIFICATION PAGE")
                case .account:
                    Text("ACCOUNT PAGE")
                }
                Spacer()
                TabBar(viewRouter: viewRouter, proxy: proxy)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
