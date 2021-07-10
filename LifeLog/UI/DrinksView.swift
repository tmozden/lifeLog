//
//  DrinksView.swift
//  LifeLog
//
//  Created by Travis Mozden on 7/7/21.
//

import SwiftUI

struct DrinksView: View {
    @ObservedObject var manager = LogManager.shared
    
    var body: some View {
        List(manager.drinks) {
            NavigationLink($0.timestamp.description + " " + $0.type.rawValue, destination: DrinkView(drink: $0))
        }
    }
}

struct DrinksView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView()
    }
}
