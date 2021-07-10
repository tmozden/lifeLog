//
//  MealBuilder.swift
//  LifeLog
//
//  Created by Travis Mozden on 7/6/21.
//

import Foundation

class MealBuilder: ObservableObject, CustomStringConvertible {
    var id: String
    @Published var origin: MealOrigin
    @Published var size: MealSize
    @Published var vegetables: VegetableQuality
    @Published var fruit: FruitQuality
    @Published var grain: GrainQuality
    @Published var protien: ProtienQuality
    @Published var healthyOil: Bool
    @Published var sugarItem: Bool
    @Published var tooMuchProtien: Bool
    @Published var tooMuchGrain: Bool
    @Published var timestamp: Date

    init(from meal: MealLog) {
        self.id = meal.id
        self.origin = meal.origin
        self.size = meal.size
        self.vegetables = meal.vegetables
        self.fruit = meal.fruit
        self.grain = meal.grain
        self.protien = meal.protien
        self.healthyOil = meal.healthyOil
        self.sugarItem = meal.sugarItem
        self.tooMuchProtien = meal.tooMuchProtien
        self.tooMuchGrain = meal.tooMuchGrain
        self.timestamp = meal.timestamp
    }
    
    init() {
        id = UUID().uuidString
        origin = .homeCooked
        size = .small
        vegetables = .none
        fruit = .none
        grain = .none
        protien = .none
        healthyOil = false
        sugarItem = false
        tooMuchGrain = false
        tooMuchProtien = false
        timestamp = Date()
    }
    
    func build() -> MealLog {
        return MealLog(id: id,
                       origin: origin,
                       size: size,
                       vegetables: vegetables,
                       fruit: fruit,
                       grain: grain,
                       protien: protien,
                       healthyOil: healthyOil,
                       sugarItem: sugarItem,
                       timestamp: timestamp,
                       tooMuchProtien: tooMuchProtien,
                       tooMuchGrain: tooMuchGrain)
    }
    
    var description: String {
        var result = ""
        result += "id: \(id)\n"
        result += "origin: \(origin)\n"
        result += "size: \(size)\n"
        result += "vegetables: \(vegetables)\n"
        result += "fruit: \(fruit)\n"
        result += "grain: \(grain)\n"
        result += "protien: \(protien)\n"
        result += "healthyOil: \(healthyOil)\n"
        result += "sugarItem: \(sugarItem)\n"
        result += "tooMuchProtien: \(tooMuchProtien)\n"
        result += "tooMuchGrain: \(tooMuchGrain)\n"
        return result
    }
}
