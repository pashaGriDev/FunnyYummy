//
//  ProfileView.swift
//  FunnyYummy
//
//  Created by dsm 5e on 29.08.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isEditProfile: Bool = false
    
    @State private var name: String = ""
    @State private var rank: String = ""
    
    @State private var editedName: String = ""
    @State private var selectedRankIndex = 0
    
    let ranks = ["Любитель", "Повар", "Шеф-повар", "Критик"]

    var body: some View {
        ZStack {
            
            VStack {
                Text("My profile")
                    .font(.title.bold())
                //MARK: - Profile Header
                ScrollView(showsIndicators: false) {
                    VStack {
                        ProfileHeaderView(name: $name, rank: $rank, isEditProfile: $isEditProfile)
                            .padding([.top, .horizontal])
                        
                        //MARK: - Recipes Title
                        HeaderTitleView(
                            title: "My Recipes",
                            hasNavigationLink: false,
                            sort: nil, type: nil, cuisine: nil
                        )
                        .padding(.horizontal)
                        
                        //MARK: - Resipes Bookmark
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)], spacing: 5) {
                            ForEach(1..<4) { _ in
                                RecipesCardView()
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 10)
                }
            }

            if isEditProfile {
                Color.black.opacity(0.5).ignoresSafeArea()
                
                VStack {
                    TextField("Имя", text: $editedName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Picker("Звание", selection: $selectedRankIndex) {
                        ForEach(0 ..< ranks.count) {
                            Text(ranks[$0])
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding()
                    
                    Button(action: {
                        isEditProfile = false
                        name = editedName
                        rank = ranks[selectedRankIndex]
                    }) {
                        Text("Сохранить")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(15)
                .padding()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(DataProvider())
    }
}
