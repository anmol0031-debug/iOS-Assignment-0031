//
//  ViewController.swift
//  UIKItClassroom
//
//  Created by Anmol Mehta on 15/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedButton(_ sender: UIButton) {
        print("Button tapped")
    }
    
}

