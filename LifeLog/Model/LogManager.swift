//
//  LogManager.swift
//  LifeLog
//
//  Created by Travis Mozden on 7/6/21.
//

import Foundation

class LogManager: ObservableObject {
    private static let mealLogKey = "LogManager.logs.meals.key"
    private static let drinkLogKey = "LogManager.logs.drinks.key"
    
    static let shared = LogManager()
    private let encoder = JSONEncoder()
    
    @Published
    private(set) var meals: [MealLog] = [] {
        didSet {
            if let mealData = try? encoder.encode(meals) {
                UserDefaults.standard.setValue(mealData, forKey: LogManager.mealLogKey)
            }
        }
    }
    
    @Published
    private(set) var drinks: [DrinkLog] = [] {
        didSet {
            if let drinkData = try? encoder.encode(drinks) {
                UserDefaults.standard.setValue(drinkData, forKey: LogManager.drinkLogKey)
            }
        }
    }
    
    private init() {
        let decoder = JSONDecoder()
        
        // Load Meals
        if let mealData = UserDefaults.standard.data(forKey: LogManager.mealLogKey) {
            if let savedMeals = try? decoder.decode([MealLog].self, from: mealData) {
                meals = savedMeals
            }
        }
        
        // Load Drinks
        if let drinkData = UserDefaults.standard.data(forKey: LogManager.drinkLogKey) {
            if let savedDrinks = try? decoder.decode([DrinkLog].self, from: drinkData) {
                drinks = savedDrinks
            }
        }
    }
    
    func save(meal: MealLog) {
        meals.append(meal)
    }
    
    func delete(meal: MealLog) {
        meals = meals.filter({$0.id != meal.id})
    }
    
    func save(drink: DrinkLog) {
        drinks.append(drink)
    }
    
    func delete(drink: DrinkLog) {
        drinks = drinks.filter({$0.id != drink.id})
    }
}
