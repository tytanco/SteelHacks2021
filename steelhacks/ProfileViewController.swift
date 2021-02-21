//
//  ProfileViewController.swift
//  steelhacks
//
//  Created by Tyler Comisky on 2/19/21.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    var profileID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = dbArr.dbData[profileID!].name
    }
}
