//
//  DrinkLog.swift
//  LifeLog
//
//  Created by Travis Mozden on 7/7/21.
//

import Foundation

enum DrinkType: String, Codable, CaseIterable, Identifiable, Displayable {
    case water
    case coffee
    case tea
    case beer
    case wine
    case mixDrink
    case sportsDrink
    case fancyCoffee
    case pop
    case dietPop
    
    var id: String {
        return self.rawValue
    }
    
    var displayText: String {
        switch self {
        case .water: return "Water"
        case .coffee: return "Coffee"
        case .tea: return "Tea"
        case .beer: return "Beer"
        case .wine: return "Wine"
        case .mixDrink: return "Mix Drink"
        case .sportsDrink: return "Sports Drink"
        case .fancyCoffee: return "Fancy Coffee"
        case .pop: return "Pop"
        case .dietPop: return "Diet Pop"
        }
    }
}


struct DrinkLog: Codable, Identifiable {
    let id: String
    let type: DrinkType
    let timestamp: Date
}

class DrinkLogBuilder: ObservableObject {
    @Published var id: String
    @Published var type: DrinkType
    @Published var timestamp: Date
    
    init(from log: DrinkLog) {
        id = log.id
        type = log.type
        timestamp = log.timestamp
    }
    
    init() {
        id = UUID().uuidString
        type = .water
        timestamp = Date()
    }
    
    func build() -> DrinkLog {
        return DrinkLog(id: id, type: type, timestamp: timestamp)
    }
}
