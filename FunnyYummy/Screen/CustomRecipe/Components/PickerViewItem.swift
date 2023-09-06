//
//  PickerViewItem.swift
//  FunnyYummy
//
//  Created by Kasharin Mikhail on 06.09.2023.
//

import SwiftUI

struct PickerViewItem: View {

    @Binding var selected: Int
    let title: String
    let dataPicker: [Int]
    
    var body: some View {
        HStack(spacing: 10) {
            Image(
                systemName: title == "Cook Time"
                ? "clock"
                : "person.2.circle.fill"
            )
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .padding(.all, 8)
                .background(Color.white.cornerRadius(10))
                .padding(.horizontal)
            
            Text(title)
                .fontWeight(.bold)
            
            Spacer(minLength: 0)
            
            Menu {
                ForEach(dataPicker.indices, id: \.self) { index in
                    Button(
                        title == "Cook Time"
                        ? "\(dataPicker[index])min"
                        : "\(dataPicker[index])"
                    ) {
                        selected = dataPicker[index]
                    }
                }

            } label: {
                HStack(spacing: 4) {
                    Text(title == "Cook Time"
                         ? "\(selected)min"
                         : "\(selected)")
                        .font(.headline)
                        .frame(width: 100,alignment: .trailing)
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                .frame(width: 120, alignment: .trailing)
                .padding(.trailing)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background(Color.gray.opacity(0.2).cornerRadius(12))
    }
}

struct PickerViewItem_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PickerViewItem(selected: .constant(25) ,title: "Cook Time", dataPicker: [5,10,15,20,25])
            PickerViewItem(selected: .constant(10) ,title: "Serves", dataPicker: Array(1...10))
        }
    }
}
