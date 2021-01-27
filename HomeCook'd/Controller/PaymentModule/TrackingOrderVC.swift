//
//  TrackingOrderVC.swift
//

import UIKit
import MapKit
import CoreLocation
class TrackingOrderVC: UIViewController,CLLocationManagerDelegate {

    // MARK: - Variables
    // MARK: - UIControls
    @IBOutlet weak var viewTrack: UIView!
    @IBOutlet weak var viewCall: UIView!
    @IBOutlet weak var imgCall: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager?
    let distanceSpan: Double = 500

    // MARK: - ViewControllers Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        if let locationManager = self.locationManager {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager.requestAlwaysAuthorization()
            locationManager.distanceFilter = 50
            locationManager.startUpdatingLocation()
        }


        // Do any additional setup after loading the view.
        
//        viewTrack.layer.cornerRadius = 25.0
        
        viewTrack.layer.cornerRadius = 25
        viewTrack.layer.masksToBounds = true
        viewTrack.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        viewCall.layer.cornerRadius = 33.0
        
        imgCall.layer.cornerRadius = imgCall.frame.size.height/2
    }
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        if let mapView = self.mapView {
            let region = MKCoordinateRegion(center: newLocation.coordinate, latitudinalMeters: self.distanceSpan, longitudinalMeters: self.distanceSpan)
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation = true
        }
    }

    @IBAction func btnBackClick(_ sender:AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
 

}
