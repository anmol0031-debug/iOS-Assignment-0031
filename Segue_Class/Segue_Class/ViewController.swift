//
//  ViewController.swift
//  Segue_Class
//
//  Created by Anmol Mehta on 18/07/25.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func
    unwindTORed (unwindSegue: UIStoryboardSegue){
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = textfield.text
    }
}

