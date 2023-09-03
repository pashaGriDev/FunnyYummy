//
//  TabBarIcon.swift
//  FunnyYummy
//
//  Created by dsm 5e on 29.08.2023.
//

import SwiftUI

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignetPage: Page
    
    let width: CGFloat
    let height: CGFloat
    let iconName: String
    
    var body: some View {
        VStack {
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(viewRouter.currentPage == assignetPage ? Color.Button.red : Color.Button.gray)
                .frame(width: width, height: height)
                .padding(.top, 15)
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            viewRouter.currentPage = assignetPage
        }
    }
}
