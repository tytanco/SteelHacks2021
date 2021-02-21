//
//  ProfileViewController.swift
//  steelhacks
//
//  Created by Tyler Comisky on 2/19/21.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var bio: UITextView!
    var profileID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = dbArr.dbData[profileID!].name
        position.text = dbArr.dbData[profileID!].position
        bio.text = dbArr.dbData[profileID!].bio
    }
}
