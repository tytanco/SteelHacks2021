//
//  ViewController.swift
//  steelhacks
//
//  Created by Tyler Comisky on 2/19/21.
//

import UIKit
import Koloda

class ViewController: UIViewController {
    @IBOutlet weak var kolodaView: KolodaView!
    
    let images = ["one", "two", "three", "four"]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        kolodaView.dataSource = self
        kolodaView.delegate = self
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
            let alert = UIAlertController(title: "You swiped right!", message: "Now you're \(images[index])", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
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
    return view
  }
}
