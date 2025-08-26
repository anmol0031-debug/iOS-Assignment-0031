//
//  moods.swift
//  ST1_Practice
//
//  Created by Anmol Mehta on 07/08/25.
//

import Foundation

enum Mood : Character{
    case Happy = "😄" , Sad = "😢" , Stressed = "😩" , Energetic = "⚡️"
    var definition: String{
        switch self {
        case .Happy:
            return "Happy"
        case .Sad:
            return "Sad"
        case .Stressed:
            return "Stressed"
        case .Energetic:
            return "Energetic"
        }
    }
}

enum Activity: Character{
    case Sedetary = "🪑" , Lightly = "🚴‍♂️" , Moderate = "🏃‍♂️" , Intensive = "🏋🏻‍♀️"
    var definition: String{
        switch self {
        case .Sedetary:
            return "Sedetary"
        case .Lightly:
            return "Lightly"
        case .Moderate:
            return "Moderate"
        case .Intensive:
            return "Intensive"
        }
    }
}
