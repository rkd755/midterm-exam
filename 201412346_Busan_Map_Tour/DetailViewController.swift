//
//  DetailViewController.swift
//  201412346_Busan_Map_Tour
//
//  Created by D7702_09 on 2017. 10. 12..
//  Copyright © 2017년 lyw. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, MKMapViewDelegate {

    var detailAddress : String?
    var detailTitle: String?
    
    
    @IBOutlet weak var myMapView: MKMapView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myMapView.delegate = self
//        
//        let address = (item as AnyObject).value(forKey: "address")
//        let title = (item as AnyObject).value(forKey: "title")
//        
//        let path = Bundle.main.path(forResource: "Address2", ofType: "plist")
//        print("path = \(String(describing: path))")
//        
//        let contents = NSArray(contentsOfFile: path!)
//        print("path = \(String(describing: contents))")
        
        var annotations = [MKPointAnnotation]()
        
        myMapView.delegate = self
        
        // optional binding
//        if let myItems = contents {
//            // Dictionary Array에서 값 뽑기
//            for item in myItems {
//                let address = (item as AnyObject).value(forKey: "address")
//                let title = (item as AnyObject).value(forKey: "title")
//                
                let geoCoder = CLGeocoder()
                
                geoCoder.geocodeAddressString(detailAddress as! String, completionHandler: { placemarks, error in
                    
                    if error != nil {
                        print(error!)
                        return
                    }
                    
                    if let myPlacemarks = placemarks {
                        let myPlacemark = myPlacemarks[0]
                        
                        print("placemark[0] = \(String(describing: myPlacemark.name))")
                        
                        let annotation = MKPointAnnotation()
                        annotation.title = self.detailTitle
                        annotation.subtitle = self.detailAddress
                        
                        if let myLocation = myPlacemark.location {
                            annotation.coordinate = myLocation.coordinate
                            annotations.append(annotation)
                        }
                        
                    }
                    print("annotations = \(annotations)")
                    self.myMapView.showAnnotations(annotations, animated: true)
                    self.myMapView.addAnnotations(annotations)
                })
    

    
    }
    
}
