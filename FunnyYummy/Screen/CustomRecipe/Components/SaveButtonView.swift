//
//  SaveButtonView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 06.09.2023.
//

import SwiftUI

struct SaveButtonView: View {
    
    let content: () -> ()
    
    var body: some View {
        Button {
            content()
        } label: {
            Text("Create recipe")
                .font(.title2.bold())
                .foregroundColor(Color.Text.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.Button.red)
                .cornerRadius(15)
        }
    }
}

struct SaveButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SaveButtonView(content: {})
    }
}
