//
//  ChatViewController.swift
//  steelhacks
//
//  Created by Tyler Comisky on 2/21/21.
//

import UIKit

class ChatViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            super.prepare(for: segue, sender: sender)

            if let secondViewController = segue.destination as? MessageViewController {
                secondViewController.modalPresentationStyle = .fullScreen
            }
    }
}
