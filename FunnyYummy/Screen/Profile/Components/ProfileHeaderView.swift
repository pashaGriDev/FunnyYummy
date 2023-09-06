//
//  ProfileHeaderView.swift
//  FunnyYummy
//
//  Created by dsm 5e on 30.08.2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @State private var isShowingPhotoPicker = false
    @State private var selectedAvatarImage: UIImage? = nil
    
    var body: some View {
        HStack {
            Button {
                isShowingPhotoPicker = true
            } label: {
                if let image = selectedAvatarImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color.Button.gray)
                        }
                } else {
                    Circle()
                        .frame(width: 50, height: 50)
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color.Button.gray)
                        }
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
                .foregroundColor(Color.Button.gray.opacity(0.5))
                .frame(width: 30, height: 30)
                .cornerRadius(5)
                .overlay {
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color.Text.white)
                }
        }
        .sheet(isPresented: $isShowingPhotoPicker, content: {
            PhotoPicker(avatarImage: $selectedAvatarImage)
                .ignoresSafeArea()
        })
        .frame(height: 50)
        .padding()
        .background(Color.Text.white)
        .cornerRadius(15)
        .shadow(color: Color.Button.black.opacity(0.15), radius: 5)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
