//
//  GetLocationVCViewController.swift
//  marktApp
//
//  Created by Ahmed on 3/23/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class GetLocationVC: UIViewController{
    
    private lazy var mainView: GetLocationView = {
           let view = GetLocationView(delegate: self)
           return view
       }()
    
    let locationManager = CLLocationManager()
    var myLocation: CLLocationCoordinate2D?
    var doneAction: ((_ lat: Double?, _ lon: Double?)->())?
       
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        determineMyCurrentLocation()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getMyLocation()
    }
    
    private func determineMyCurrentLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
        
    
}

extension GetLocationVC: CLLocationManagerDelegate {
  // handle delegate methods of location manager here

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("user allow app to get location data when app is active or in background")
        case .authorizedWhenInUse:
            print("user allow app to get location data only when app is active")
        case .denied:
            print("user tap 'disallow' on the permission dialog, cant get location data")
        case .restricted:
            print("parental control setting disallow location data")
        case .notDetermined:
            print("the location permission dialog haven't shown before, user haven't tap allow/disallow")
        @unknown default:
            break
        }
    }

//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last{
//            print(location)
//            self.updateUI(location: location)
//        }
//    }
    
    private func updateUI(location: CLLocation){
        fetchCityAndCountry(from: location) { (address, error) in
            self.mainView.locationLbl.text = address
            self.myLocation = location.coordinate
            self.setLocationOnMap(title: address, location: location.coordinate)
        }
    }
    private func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ address: String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            var address = ""
            if let country = placemarks?.first?.locality {
                address = country + ", "
            }
            if let city = placemarks?.first?.country {
                address += city + ", "
            }
            if let adArea = placemarks?.first?.administrativeArea {
                address += adArea
            }
            completion(address, error)
        }
    }
    
    private func setLocationOnMap(title: String?, location: CLLocationCoordinate2D){
        let map = mainView.mapView
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        map.setRegion(region, animated: true)
        map.removeAnnotations(map.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = title
        map.addAnnotation(annotation)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("we find error: \(error)")
    }
    
    func serchForLocation(location name: String) {
        let map = mainView.mapView
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = name
        request.region = map.region
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else {
                return
            }
            let showRVC = ShowSearchResultsVC()
            showRVC.matchingItems = response.mapItems
            showRVC.didSelectAction = { [weak self] mapItem in
                guard let self = self, let location = mapItem?.placemark.location else { return }
//                self.setLocationOnMap(title: mapItem.name, location: mapItem.placemark.coordinate)
                self.updateUI(location: location)
            }
            self.present(showRVC, animated: true)
        }
    }
}



extension GetLocationVC: GetLocationViewDelegate{
    func getMyLocation() {
        if let myLocation = locationManager.location{
            self.updateUI(location: myLocation)
        }
        
    }
    
    func keyboardReturn(search text: String) {
        serchForLocation(location: text)
    }
    
    func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func confiremLocationAction() {
        if let doneAction = doneAction{
            doneAction(myLocation?.latitude, myLocation?.longitude)
            closeAction()
        } else {
            self.showAlert(msg: "There is an error when get loction", nil)
        }
    }
}
