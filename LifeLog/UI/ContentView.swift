//
//  ContentView.swift
//  LifeLog
//
//  Created by Travis Mozden on 7/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Quick Drink")
                    .padding(.bottom, .some(3))
                HStack {
                    let buttonWidth = (UIScreen.screenWidth / 3) * 0.7
                    Button(action: {
                        let builder = DrinkLogBuilder()
                        builder.type = .water
                        LogManager.shared.save(drink: builder.build())
                    }, label: {
                        Text(DrinkType.water.displayText)
                    })
                    .frame(width: buttonWidth)
                    Button(action: {
                        let builder = DrinkLogBuilder()
                        builder.type = .coffee
                        LogManager.shared.save(drink: builder.build())
                    }, label: {
                        Text(DrinkType.coffee.displayText)
                    })
                    .frame(width: buttonWidth)
                    Button(action: {
                        let builder = DrinkLogBuilder()
                        builder.type = .tea
                        LogManager.shared.save(drink: builder.build())
                    }, label: {
                        Text(DrinkType.tea.displayText)
                    })
                    .frame(width: buttonWidth)
                }.padding(.bottom)
                
                Text("Add Or View")
                    .padding(.bottom, .some(3))
                HStack(spacing: .some(50)) {
                    NavigationLink(destination: AddMealView()) {
                        Text("Add Meal")
                    }
                    .padding(.horizontal)
                    NavigationLink(destination: AddDrinkView()) {
                        Text("Add Drink")
                    }
                    .padding(.horizontal)
                }
                HStack(spacing: .some(50)) {
                    NavigationLink(destination: MealsView()) {
                        Text("View Meals")
                    }
                    .padding()
                    NavigationLink(destination: DrinksView()) {
                        Text("View Drinks")
                    }
                    .padding()
                }
                Spacer()
            }
            .navigationBarTitle("Life Log", displayMode: .automatic)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
