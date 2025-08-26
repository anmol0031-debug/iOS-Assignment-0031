//
//  ViewController.swift
//  Login_Practice
//
//  Created by Anmol Mehta on 30/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var forgetUser: UIButton!
    @IBOutlet weak var forgetPass: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        if sender == forgetUser {
            segue.destination.navigationItem.title = "Forget Username"
        }
        else if sender == forgetPass {
            segue.destination.navigationItem.title = "Forget Password"
        }
        else {
            segue.destination.navigationItem.title = usernameText.text
        }
    }
    @IBAction func forgetUsername(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: sender)
    }
    
    @IBAction func forgetPasswordTapped(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: sender)
    }
    
}

