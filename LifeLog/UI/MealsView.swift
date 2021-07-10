//
//  MealsView.swift
//  LifeLog
//
//  Created by Travis Mozden on 7/6/21.
//

import SwiftUI

struct MealsView: View {
    @ObservedObject var manager = LogManager.shared
    
    var body: some View {
        List(manager.meals) {
            NavigationLink($0.timestamp.description + " " + $0.size.rawValue, destination: MealView(meal: $0))
        }
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView()
    }
}
