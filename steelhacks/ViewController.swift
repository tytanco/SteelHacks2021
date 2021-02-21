//
//  ViewController.swift
//  steelhacks
//
//  Created by Tyler Comisky on 2/19/21.
//

import UIKit
import Koloda
import CoreLocation
import Firebase

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var kolodaView: KolodaView!
    private var locationManager = CLLocationManager()
    static var userInformation: userData!

    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        
        // The below query is for retrieving profile information
        let docRef = db.collection("users").document(Auth.auth().currentUser!.uid)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let uName = document.get("name")
                let imgurl = document.get("imageURL")
                let biography = document.get("bio")
                let mail = document.get("email")
                let gsReference = self.storage.reference(forURL: imgurl as! String)
                
                gsReference.getData(maxSize: 20 * 1024 * 1024) {
                    data, error in
                    if let error = error {
                        print(error)
                    } else {
                        userArr.usrData = userData(name: (uName as! String), profilePic: UIImage(data: data!)!, bio: (biography as! String), email: (mail as! String))
                    }
                }
                
            } else {
                print("Document does not exist")
            }
        }
    }

}


extension ViewController: KolodaViewDelegate {
  func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
    koloda.resetCurrentCardIndex()
  }
  
  func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
    /*let alert = UIAlertController(title: "Congratulation!", message: "You matched with " + dbArr.dbData[index].name!, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    self.present(alert, animated: true)*/
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    let customViewController = storyboard.instantiateViewController(withIdentifier: "ProfileID") as!ProfileViewController
    
    customViewController.profileID = index
    
    self.present(customViewController, animated: true, completion: nil)
  }
    
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        if (direction == SwipeResultDirection.right) {
            
            
            let alert = UIAlertController(title: "CongratulationS!", message: "You matched with " + dbArr.dbData[index].name!, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    
        
    }
}


extension ViewController: KolodaViewDataSource {
  
  func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
    return dbArr.dbData.count
  }
  
  func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
    
    let view = UIImageView(image: dbArr.dbData[index].image)
    
    view.layer.cornerRadius = 20
    view.clipsToBounds = true

    let text = UILabel(frame:CGRect(origin: CGPoint(x: 0,y: 450), size: CGSize(width: 339, height: 40)))
    text.text = dbArr.dbData[index].position! + ", " + dbArr.dbData[index].name!
    text.textColor = UIColor.black
    text.font = UIFont(name: text.font.fontName, size: 20)
    text.textAlignment = NSTextAlignment.left
    text.backgroundColor = UIColor.white
    text.layer.masksToBounds = true
    text.layer.cornerRadius = 5
    
    view.addSubview(text)
    
    return view
  }
}
