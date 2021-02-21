//
//  UserProfileViewController.swift
//  steelhacks
//
//  Created by Tyler Comisky on 2/20/21.
//

import UIKit
import Firebase

class UserProfileViewController: UIViewController {
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var bio: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        username.text = userArr.usrData.name
        profilePic.image = userArr.usrData.profilePic
        email.text = userArr.usrData.email
        bio.text = userArr.usrData.bio
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
