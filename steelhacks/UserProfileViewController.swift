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
                    print(imgurl)
                    if (imgurl  != nil && uName != nil){
                        let gsReference = storage.reference(forURL: imgurl as! String)
                        gsReference.getData(maxSize: 20 * 1024 * 1024) {
                            data, error in
                            if let error = error {
                                print(error)
                            } else {
                                self.username.text = (uName as! String)
                            }
                        }
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
