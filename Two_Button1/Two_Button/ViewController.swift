//
//  ViewController.swift
//  Two_Button
//
//  Created by Anmol Mehta on 16/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    
    @IBAction func setTextButtonTapped(_ sender: Any) {
        let testText = textField.text ?? ""
        label.text = testText
    }
    
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        let textToClear: String = ""
        textField.text = textToClear
        label.text = textToClear
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

