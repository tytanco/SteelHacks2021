//
//  SignUpViewController.swift
//  steelhacks
//
//  Created by Tyler Comisky on 2/20/21.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBAction func nextButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toSignIn", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
