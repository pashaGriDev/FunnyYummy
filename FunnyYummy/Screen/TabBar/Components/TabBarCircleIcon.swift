//
//  TabBarCircleIcon.swift
//  FunnyYummy
//
//  Created by dsm 5e on 06.09.2023.
//

import SwiftUI

struct TabBarCircleIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignetPage: Page
    let proxy: GeometryProxy
    @State private var rotationAngle: Double = 0 // Добавляем состояние для управления углом поворота
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.Button.red)
                .frame(width: proxy.size.width/7, height: proxy.size.height/7)
                .shadow(color: .black.opacity(0.05), radius: 8, y: -1)
            Image("plus")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.Text.white)
                .frame(width: proxy.size.width/23, height: proxy.size.height/23)
                .rotationEffect(.degrees(rotationAngle)) // Используем rotationAngle
        }
        .onTapGesture {
            withAnimation {
                rotationAngle += 180 // Анимированно меняем угол поворота
                viewRouter.currentPage = assignetPage
            }
        }
        .offset(y: -proxy.size.height/8/2)
    }
}

