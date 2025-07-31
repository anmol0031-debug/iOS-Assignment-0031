//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Student on 24/07/25.
//

import UIKit

class IntroVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startQuizPressed(_ sender: Any) {
        performSegue(withIdentifier: "startQuiz", sender: nil)
    }
    
    @IBAction func unwindToIntroVc(segue: UIStoryboardSegue) {}
    
}
