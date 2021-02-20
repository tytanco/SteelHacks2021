//
//  WelcomeViewController.swift
//  steelhacks
//
//  Created by Tyler Comisky on 2/20/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBAction func nextButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toSignUp", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            super.prepare(for: segue, sender: sender)

            if let secondViewController = segue.destination as? SignUpViewController {
                secondViewController.modalPresentationStyle = .fullScreen
            }
        }
}
