//
//  DrinkView.swift
//  LifeLog
//
//  Created by Travis Mozden on 7/7/21.
//

import SwiftUI

struct DrinkView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let drink: DrinkLog
    
    var body: some View {
        VStack(spacing: .some(5)) {
            Text(drink.timestamp.description).bold().padding(.vertical, 10)
            Text("Type: \(drink.type.rawValue)")
            
            Button("Delete", action: {
                LogManager.shared.delete(drink: drink)
                presentationMode.wrappedValue.dismiss()
            })
            .padding(.top, 20)
            .foregroundColor(.red)
            
            Spacer()
        }
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView(drink: DrinkLogBuilder().build())
    }
}


