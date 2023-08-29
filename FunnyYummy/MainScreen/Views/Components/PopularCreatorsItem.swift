//
//  PopularCreatorsView.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 29.08.2023.
//

import SwiftUI

struct PopularCreatorsItem: View {
    
    let url = "https://demotivation.ru/wp-content/uploads/2021/01/1_2Stf2unFSKZ5Nh91E-GeIw.jpeg"
    
    var body: some View {
        VStack {
            ImageLoaderView(url: url)
                .frame(width: 120, height: 120)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
            
            Text("Kasharin Mikhail")
                .font(.headline)
        }
    }
}

struct PopularCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularCreatorsItem()
    }
}
