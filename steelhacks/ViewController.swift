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
    
    let images = ["one", "two", "three", "four"]
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
        //self.locationManager.requestLocation()
    }


    func locationManager(didFailWithError error: NSError!) {
            print("didFailWithError: \(error.description)")
        let errorAlert = UIAlertController(title: "Error", message: "Failed to get your location.", preferredStyle: UIAlertController.Style.alert)
                                               
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                (result : UIAlertAction) -> Void in
                print("OK")
            }
            errorAlert.addAction(okAction)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation:CLLocation = locations.last! as CLLocation
        print("current position: \(newLocation.coordinate.longitude) , \(newLocation.coordinate.latitude)")
     
    }
    
}


extension ViewController: KolodaViewDelegate {
  func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
    koloda.resetCurrentCardIndex()
  }
  
  func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
    let alert = UIAlertController(title: "Congratulation!", message: "Now you're \(images[index])", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    self.present(alert, animated: true)
  }
    
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        if (direction == SwipeResultDirection.right) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let customViewController = storyboard.instantiateViewController(withIdentifier: "ProfileID") as!ProfileViewController
            
            self.present(customViewController, animated: true, completion: nil)
        }
    
    }
}


extension ViewController: KolodaViewDataSource {
  
  func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
    return images.count
  }
  
  func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
    let view = UIImageView(image: UIImage(named: images[index]))
    
    view.layer.cornerRadius = 20
    view.clipsToBounds = true
    
    let text = UILabel(frame:CGRect(origin: CGPoint(x: 40,y: 450), size: CGSize(width: 150, height: 40)))
    text.text = "Name"
    text.font = UIFont(name: text.font.fontName, size: 20)
    text.textAlignment = NSTextAlignment.center
    text.backgroundColor = UIColor.black
    
    view.addSubview(text)
    
    return view
  }
}
