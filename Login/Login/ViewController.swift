//
//  ViewController.swift
//  Login
//
//  Created by Student on 18/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var forgotUserNameButton: UIButton!
    
    @IBOutlet weak var forgotpasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        segue.destination.navigationItem.title = username.text
//    }
    
    @IBAction func forgotUsernameTapped(_ sender:UIButton){
        performSegue(withIdentifier: "MainSegue", sender: sender)
    }
    
    @IBAction func forgotPasswordTapped(_ sender:UIButton){
        performSegue(withIdentifier: "MainSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else{return}
        if sender == forgotpasswordButton{
            segue.destination.navigationItem.title = "Forgot Password"
        }
        else if sender == forgotUserNameButton{
            segue.destination.navigationItem.title = "Forgot Username"
        }else{
            segue.destination.navigationItem.title = username.text
        }
    }
    

   

}

