//
//  SignInViewController.swift
//  steelhacks
//
//  Created by Tyler Comisky on 2/20/21.
//

import UIKit
import Firebase

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBAction func loginAction(_ sender: Any) {
            Auth.auth().signIn(withEmail: email.text!, password: password.text!) {
                (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "signInToHome", sender: self)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.delegate = self
        password.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            super.prepare(for: segue, sender: sender)

            if let secondViewController = segue.destination as? ViewController {
                secondViewController.modalPresentationStyle = .fullScreen
            }
        
            /*if segue.destination is ViewController {
                let vc = segue.destination as? ViewController
                vc?.email = email.text!
            }*/
    }
}
