//
//  ProfileHeaderView.swift
//  FunnyYummy
//
//  Created by dsm 5e on 30.08.2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Circle()
                    .frame(width: 50, height: 50)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(.gray)
                    }
            }
            VStack(alignment: .leading) {
                Text("Custom Name")
                    .font(.headline)
                Text("Chief cook")
                    .font(.subheadline)
            }
            Spacer()
            
            Rectangle()
                .foregroundColor(.gray.opacity(0.5))
                .frame(width: 30, height: 30)
                .cornerRadius(5)
                .overlay {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
        }
        .frame(height: 50)
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.15), radius: 5)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
