//
//  ProfileView.swift
//  FunnyYummy
//
//  Created by dsm 5e on 29.08.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var dataProvider: DataProvider
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack {
                //MARK: - Profile Header
                VStack {
                    ProfileHeaderView()
                        .padding([.top, .horizontal])
                    //MARK: - Resipes Bookmark
                    ScrollView(showsIndicators: false) {
                        HeaderTitleView(
                            title: "My Recipes",
                            hasNavigationLink: false,
                            sort: nil, type: nil, cuisine: nil
                        )
                        .padding(.horizontal)
                        
                        VStack(spacing: 16) {
                            ForEach($dataProvider.recipes) {
                                RecipesCardView(recipe: $0, isEditing: $isEditing)
                            }
                        }
                    }
                }
                .padding(.top, 10)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("My Profile")
                        .font(.title.bold())
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isEditing.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color.Button.black)
                    }
                }
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
