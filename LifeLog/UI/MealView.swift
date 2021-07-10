//
//  MealView.swift
//  LifeLog
//
//  Created by Travis Mozden on 7/6/21.
//

import SwiftUI

struct MealView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let meal: MealLog
    
    var body: some View {
        VStack(spacing: .some(5)) {
            Text(meal.timestamp.description).bold().padding(.vertical, 10)
            Text("Type: \(meal.origin.rawValue)")
            Text("Size: \(meal.size.rawValue)")
            Text("Vegetables: \(meal.vegetables.rawValue)")
            Text("Fruit: \(meal.fruit.rawValue)")
            Text("Grain: \(meal.grain.rawValue)")
            Text("Protien: \(meal.protien.rawValue)")
            Text("Sugar Item: \(meal.sugarItem ? "Yes" : "No")")
            
            Button("Delete", action: {
                LogManager.shared.delete(meal: meal)
                presentationMode.wrappedValue.dismiss()
            })
            .padding(.top, 20)
            .foregroundColor(.red)
            
            Spacer()
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(meal: MealBuilder().build())
    }
}

