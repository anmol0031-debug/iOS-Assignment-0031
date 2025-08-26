//
//  ActivityViewController.swift
//  ST1_Practice
//
//  Created by Anmol Mehta on 07/08/25.
//

import UIKit

class ActivityViewController: UIViewController {
    var activityChhose : Activity?
    var moodChose : Mood?

    
    
    @IBOutlet weak var ActivityButton1: UIButton!
    @IBOutlet weak var ActivityButton2: UIButton!
    @IBOutlet weak var ActivityButton3: UIButton!
    @IBOutlet weak var ActivityButton4: UIButton!
    
    
    
    @IBOutlet weak var ActivityLabel1: UILabel!
    
    @IBOutlet weak var ActivityLabel2: UILabel!
    
    @IBOutlet weak var ActivityLabel3: UILabel!
    
    @IBOutlet weak var ActivityLabel4: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Set your Activity Level"
        ActivityButton1.setTitle(String(Activity.Sedetary.rawValue), for: .normal)
        ActivityButton2.setTitle(String(Activity.Lightly.rawValue), for: .normal)
        ActivityButton3.setTitle(String(Activity.Moderate.rawValue), for: .normal)
        ActivityButton4.setTitle(String(Activity.Sedetary.rawValue), for: .normal)
        
        ActivityLabel1.text = Activity.Sedetary.definition
        ActivityLabel2.text = Activity.Lightly.definition
        ActivityLabel3.text = Activity.Moderate.definition
        ActivityLabel4.text = Activity.Sedetary.definition
        
        

    }
    
    
    @IBAction func ActivityButtonTapped(_ sender: UIButton) {
        switch sender {
        case ActivityButton1:
            activityChhose = .Sedetary
        case ActivityButton2:
            activityChhose = .Lightly
        case ActivityButton3:
            activityChhose = .Moderate
        case ActivityButton4:
            activityChhose = .Intensive
        default:
          break
        }
        
        performSegue(withIdentifier: "ActivityToResult", sender: self )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let result = segue.destination as? ResultViewController else {
            return
        }
        result.moodChose = moodChose
        result.activityChhose = activityChhose
    }

  

}
