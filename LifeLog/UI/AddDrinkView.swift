//
//  AddDrinkView.swift
//  LifeLog
//
//  Created by Travis Mozden on 7/7/21.
//

import SwiftUI

struct AddDrinkView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        let buttonDimension = (UIScreen.screenWidth * 0.6) / 2
        LazyVGrid(columns: columns) {
            ForEach(0...DrinkType.allCases.count-1, id: \.self) { drinkIndex in
                Button(action: {
                    let builder = DrinkLogBuilder()
                    builder.type = DrinkType.allCases[drinkIndex]
                    LogManager.shared.save(drink: builder.build())
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text(DrinkType.allCases[drinkIndex].displayText)
                })
                .frame(width: buttonDimension, height: buttonDimension)
                
            }
        }
            
        Spacer()
    }
}

struct AddDrinkView_Previews: PreviewProvider {
    static var previews: some View {
        AddDrinkView()
    }
}
