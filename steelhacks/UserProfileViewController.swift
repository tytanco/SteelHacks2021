//
//  UserProfileViewController.swift
//  steelhacks
//
//  Created by Tyler Comisky on 2/20/21.
//

import UIKit
import Firebase

// TODO: move database query to AppDelegate

class UserProfileViewController: UIViewController {
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var bio: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        let db = Firestore.firestore()
        let storage = Storage.storage()
        
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                //self.size = querySnapshot!.documents.count
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let imgurl = document.get("imageURL")
                    let uName = document.get("name")
                    let theEmail = document.get("email")
                    let theBio = document.get("bio")
                    if (imgurl  != nil && uName != nil && theEmail != nil && theBio != nil){
                        let gsReference = storage.reference(forURL: imgurl as! String)
                        gsReference.getData(maxSize: 20 * 1024 * 1024) {
                            data, error in
                            if let error = error {
                                print(error)
                            } else {
                                self.profilePic.image = UIImage(data: data!)!
                                self.profilePic.layer.masksToBounds = true
                                self.profilePic.layer.cornerRadius = 10
                            }
                        }
                        
                        self.username.text = (uName as! String)
                        self.email.text = (theEmail as! String)
                        self.bio.text = (theBio as! String)
                    }
                }
                print("done with pictures")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //username.text = Auth.auth().currentUser?.uid
    }
}
