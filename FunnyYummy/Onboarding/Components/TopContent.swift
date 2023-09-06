//
//  TopContent.swift
//  FunnyYummy
//
//  Created by dsm 5e on 03.09.2023.
//

import SwiftUI

struct TopContent: View {
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(Color.Button.red)
            Text("100k Premium recipes")
        }
        .padding(.top, 50)
    }
}
