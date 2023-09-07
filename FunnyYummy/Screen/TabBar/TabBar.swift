//
//  TabBar.swift
//  FunnyYummy
//
//  Created by dsm 5e on 29.08.2023.
//

import SwiftUI

struct TabBar: View {
    @StateObject var viewRouter: ViewRouter
    let proxy: GeometryProxy
    
    var body: some View {
        HStack {
            TabBarIcon(viewRouter: viewRouter, assignetPage: .main, width: proxy.size.width/5, height: proxy.size.height/28, iconName: "home")
            TabBarIcon(viewRouter: viewRouter, assignetPage: .favorites, width: proxy.size.width/5, height: proxy.size.height/28, iconName: "book")
            TabBarCircleIcon(viewRouter: viewRouter, assignetPage: .addRecipe, proxy: proxy)
            TabBarIcon(viewRouter: viewRouter, assignetPage: .notifications, width: proxy.size.width/5, height: proxy.size.height/28, iconName: "bell")
            TabBarIcon(viewRouter: viewRouter, assignetPage: .profile, width: proxy.size.width/5, height: proxy.size.height/28, iconName: "person")
        }
        .frame(width: proxy.size.width, height: proxy.size.height/8)
        .background(TabBarCustomShape())
        .shadow(color: .black.opacity(0.1), radius: 5, y: 0)
    }
}
