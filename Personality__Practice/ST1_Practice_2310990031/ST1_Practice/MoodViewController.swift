//
//  MoodViewController.swift
//  ST1_Practice
//
//  Created by Anmol Mehta on 07/08/25.
//

import UIKit

class MoodViewController: UIViewController {
    var moodChose : Mood?

    @IBOutlet weak var MoodButton1: UIButton!
    @IBOutlet weak var MoodButton2: UIButton!
    @IBOutlet weak var MoodButton3: UIButton!
    @IBOutlet weak var MoodButton4: UIButton!
    
    
    @IBOutlet weak var MoodLabel1: UILabel!
    
    @IBOutlet weak var MoodLabel2: UILabel!
  
    @IBOutlet weak var MoodLabel3: UILabel!
    
    
    @IBOutlet weak var MoodLabel4: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Set your Current Mood"
        MoodButton1.setTitle(String(Mood.Happy.rawValue), for: .normal)
        MoodButton2.setTitle(String(Mood.Sad.rawValue), for: .normal)
        MoodButton3.setTitle(String(Mood.Stressed.rawValue), for: .normal)
        MoodButton4.setTitle(String(Mood.Energetic.rawValue), for: .normal)

        
        MoodLabel1.text = Mood.Happy.definition
        MoodLabel2.text = Mood.Sad.definition
        MoodLabel3.text = Mood.Stressed.definition
        MoodLabel4.text = Mood.Energetic.definition
        
    }
    
    @IBAction func MoodButtonTapped(_ sender: UIButton) {
        switch sender {
        case MoodButton1:
            moodChose = .Happy
        case MoodButton2:
            moodChose = .Sad
        case MoodButton3:
            moodChose = .Stressed
        case MoodButton4:
            moodChose = .Energetic
        default:
            break
        }
        
        performSegue(withIdentifier: "MoodToActivity", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ActivityViewController else { return }
        destinationVC.moodChose = moodChose
        
    }
    
    
    
    


}
