//
//  ProfileView.swift
//  FunnyYummy
//
//  Created by dsm 5e on 29.08.2023.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        VStack {
            //MARK: - Profile Header
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ProfileHeaderView()
                        .padding([.top, .horizontal])

                    //MARK: - Recipes Title
                    HeaderTitleView(
                        title: "My Recipes",
                        hasNavigationLink: false,
                        sort: nil, type: nil, cuisine: nil
                    )
                        .padding(.horizontal)
                    
                    //MARK: - Resipes Bookmark
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)], spacing: 8) {
                        ForEach(1..<4) { _ in
                            RecipesCardView()
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 10)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("My Profile")
                    .font(.title.bold())
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(Color.Button.black)
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
