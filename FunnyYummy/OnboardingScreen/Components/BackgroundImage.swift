//
//  BackgroundImage.swift
//  FunnyYummy
//
//  Created by dsm 5e on 03.09.2023.
//

import SwiftUI

struct BackgroundImage: View {
    var body: some View {
        Image("Onboarding")
            .resizable()
            .scaledToFit()
            .ignoresSafeArea()
            .scaleEffect(1.2)
    }
}
