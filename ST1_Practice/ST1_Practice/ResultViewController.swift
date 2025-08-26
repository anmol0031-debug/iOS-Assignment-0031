//
//  ResultViewController.swift
//  ST1_Practice
//
//  Created by Anmol Mehta on 07/08/25.
//

import UIKit

class ResultViewController: UIViewController {
    var activityChhose : Activity?
    var moodChose : Mood?
    
    @IBOutlet weak var ResultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let activity = activityChhose, let mood = moodChose {
            let suggstion = getMealSuggestion(mood: mood, activity: activity)
            ResultLabel.text = "\"\(suggstion)\""
        }
    }
    func getMealSuggestion(mood: Mood, activity: Activity) -> String {
        switch (mood, activity) {
        case (.Happy, .Sedetary):
            return "Grilled chicken salad 🥗"
        case (.Happy, .Lightly):
            return "Protein smoothie 🥤"
        case (.Happy, .Moderate):
            return "Fruit bowl 🍓"
        case (.Happy, .Intensive):
            return "Light yogurt parfait 🍨"
            
        case (.Sad, .Sedetary):
            return "Comfort pasta 🍝"
        case (.Sad, .Lightly):
            return "Warm soup 🍲"
        case (.Sad, .Moderate):
            return "Chocolate treat 🍫"
        case (.Sad, .Intensive):
            return "Herbal tea 🍵"
            
        case (.Stressed, .Sedetary):
            return "Spicy burrito 🌯"
        case (.Stressed, .Lightly):
            return "Energy bar 🍫"
        case (.Stressed,.Moderate ):
            return "Nuts and seeds mix 🥜"
        case (.Stressed, .Intensive):
            return "Chamomile tea 🍵"
            
        case (.Energetic, .Sedetary):
            return "Quinoa bowl 🍲"
        case (.Energetic, .Lightly):
            return "Coconut water 🥥"
        case (.Energetic, .Moderate):
            return "Avocado toast 🥑"
        case (.Energetic, .Intensive):
            return "Warm milk 🥛"
        }
    }

 

}
