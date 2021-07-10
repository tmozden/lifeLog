//
//  MealLog.swift
//  LifeLog
//
//  Created by Travis Mozden on 7/6/21.
//

import Foundation
import SwiftUI

protocol Displayable {
    var displayText: String { get }
}

enum MealOrigin: String, Codable, CaseIterable, Identifiable, Displayable {
    case homeCooked = "home_cooked"
    case purchased = "purchased"
    
    var id: String {
        return self.rawValue
    }
    
    var displayText: String {
        switch self {
        case .homeCooked: return "Home Cooked"
        case .purchased: return "Purchased"
        }
    }
}

enum MealSize: String, Codable, CaseIterable, Identifiable, Displayable {
    case small
    case medium
    case large
    
    var id: String {
        return self.rawValue
    }
    
    var displayText: String {
        switch self {
        case .small: return "Small"
        case .medium: return "Medium"
        case .large: return "Large"
        }
    }
}

enum VegetableQuality: String, Codable, CaseIterable, Identifiable, Displayable {
    case none
    case some
    case thirtyFivePercent
    case fiftyPercent
    
    var id: String {
        return self.rawValue
    }
    var displayText: String {
        switch self {
        case .none: return "None"
        case .some: return "Some"
        case .thirtyFivePercent: return "35%"
        case .fiftyPercent: return "50%"
        }
    }
}

enum GrainQuality: String, Codable, CaseIterable, Identifiable, Displayable {
    case none
    case processed
    case whole
    case wholeTwentyFivePercent
    
    var id: String {
        return self.rawValue
    }
    var displayText: String {
        switch self {
        case .none: return "None"
        case .processed: return "White"
        case .whole: return "Whole"
        case .wholeTwentyFivePercent: return "Whole 25%"
        }
    }
}

enum ProtienQuality: String, Codable, CaseIterable, Identifiable, Displayable {
    case none
        //Indicates Fried/Red/Processed meats
    case unhealthy
    case healthy
    case healthyTwentyFivePercent
    
    var id: String {
        return self.rawValue
    }
    var displayText: String {
        switch self {
        case .none: return "None"
        case .unhealthy: return "Unhealthy"
        case .healthy: return "Healthy"
        case .healthyTwentyFivePercent: return "Healthy 25%"
        }
    }
}

enum FruitQuality: String, Codable, CaseIterable, Identifiable, Displayable {
    case none
    case some
    case fifteenPercent
    
    var id: String {
        return self.rawValue
    }
    
    var displayText: String {
        switch self {
        case .none: return "None"
        case .some: return "Some"
        case .fifteenPercent: return "15%"
        }
    }
}

struct MealLog: Identifiable, Codable, CustomStringConvertible {
    let id: String
    let origin: MealOrigin
    let size: MealSize
    let vegetables: VegetableQuality
    let fruit: FruitQuality
    let grain: GrainQuality
    let protien: ProtienQuality
    let healthyOil: Bool
    let sugarItem: Bool
    let timestamp: Date
    let tooMuchProtien: Bool
    let tooMuchGrain: Bool
    
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
        result += "timestamp: \(timestamp.description)"
        return result
    }
}
