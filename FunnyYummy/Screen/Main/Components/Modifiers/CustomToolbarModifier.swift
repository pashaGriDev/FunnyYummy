//
//  CustomToolbarModifier.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 02.09.2023.
//

import SwiftUI

struct CustomToolbarModifier: ViewModifier {
    let title: String
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.title.bold())
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color.Button.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(Color.Button.black)
                }
            }
    }
}

extension View {
    func navigationHeader(title: String) -> some View {
        self.modifier(CustomToolbarModifier(title: title))
    }
}
