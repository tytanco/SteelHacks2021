//
//  AppDelegate.swift
//  steelhacks
//
//  Created by Tyler Comisky on 2/19/21.
//

import UIKit
import CoreData
import Firebase
import CoreLocation

@main
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    private var locationManager = CLLocationManager()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        let db = Firestore.firestore()
        let storage = Storage.storage()
        
        db.collection("organizations").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                //self.size = querySnapshot!.documents.count
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let imgurl = document.get("imageURL")
                    let orgName = document.get("name")
                    let posName = document.get("position")
                    if (imgurl  != nil && orgName != nil && posName != nil){
                        let gsReference = storage.reference(forURL: imgurl as! String)
                        gsReference.getData(maxSize: 20 * 1024 * 1024) {
                            data, error in
                            if let error = error {
                                print(error)
                            } else {
                                dbArr.dbData.append(databaseData(image: UIImage(data: data!)!, name: (orgName as! String), position: (posName as! String)))
                            }
                        }
                    }
                }
                print("done with pictures")
            }
        }
        return true
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

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "steelhacks")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
//    func getDistance(var lat, var lon, var plat, varplon){
//
//    }

}

struct databaseData {
    let image: UIImage?
    let name: String?
    let position: String?
    
}

struct dbArr {
    //static var imageArr: Array<UIImage> = Array()
    static var dbData: Array<databaseData> = Array()
}

