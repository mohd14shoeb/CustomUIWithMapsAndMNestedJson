//
//  ViewController.swift
//  CustomPickersAndJsonDateAndTimeParsing
//
//  Created by Malovic, Milos on 3/6/19.
//  Copyright © 2019 Malovic, Milos. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import expanding_collection

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    // MARK: IBOutlet's
    
    @IBOutlet weak var containeView: UIView!
    @IBOutlet weak var sitesMapView: MKMapView!
    @IBOutlet weak var nearestView: UIView!
    @IBOutlet weak var mapSwipeIndicator: UIImageView!
    @IBOutlet weak var topContraintBlueView: NSLayoutConstraint!
    
    // MARK: Properties
    
    private var sites = [Sites]()
    private var pinLocationsOnMap = [MKPointAnnotation]()
    private var locationManager = CLLocationManager()
    private var panGesture = UIPanGestureRecognizer()
    private var animator = UIViewPropertyAnimator()
    fileprivate var cellsIsOpen = [Bool]()
    
    // MARK: LIfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadSites()
        checkLocationServices()
        addPanGestureRecognizer(view: nearestView)
        setIndicatorAnimationForStart()
    }
    
    // MARK: Function's
    
    func addPanGestureRecognizer(view: UIView) {
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.self.swipedOnViewAction(sender:)))
        view.addGestureRecognizer(panGesture)
        panGesture.delegate = self
    }

    @objc func swipedOnViewAction(sender: UIPanGestureRecognizer) {
        if nearestView == sender.view {
            switch sender.state {
            case .began:
                moveViewWithPan(view: nearestView, sender: sender)
            case .ended:
                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .beginFromCurrentState, animations: {
                    if self.topContraintBlueView.priority == .defaultHigh {
                        self.topContraintBlueView.priority = .defaultLow
                        self.containeView.isHidden = false
                        self.view.layoutIfNeeded()
                    } else {
                        self.topContraintBlueView.priority = .defaultHigh
                        self.containeView.isHidden = true
                        self.view.layoutIfNeeded()
                    }
                })
            case .cancelled:
                break
            default:
                break
            }
        }
    }
    
    func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    func setIndicatorAnimationForStart() {
        UIView.animate(withDuration: 1.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1.0, options: .curveEaseIn, animations: {
            self.mapSwipeIndicator.frame = CGRect(x: self.nearestView.frame.origin.x, y: self.nearestView.frame.origin.y, width: 300, height: 14)
        })
    }

    func downloadSites() {
        SiteServices.getSitesNearBy { [weak self] (result) in
            if let err = result as? UIAlertController {
                self!.present(err, animated: true, completion: nil)
            } else if let site = result as? Sites {
                self!.sites = [site]
            }
        }
    }
    
    
    func checkLocationAuth() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            sitesMapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            let alert = UIAlertController(title: "Location disabled", message: "enable location in settings", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        default:
            break
        }
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuth()
            setPinsOnMapView()
        } else {
            let alert = UIAlertController(title: "Location disabled", message: "enable location in settings", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func setPinsOnMapView() {
        for pinInfo in DataManager.shared.sitesDataManager {
            let location = CLLocationCoordinate2D(latitude: pinInfo.latitude, longitude: pinInfo.longitude)
            let anotation = MKPointAnnotation()
            anotation.coordinate = location
            anotation.title = pinInfo.siteName
            anotation.subtitle = pinInfo.adressLine1
            pinLocationsOnMap.append(anotation)
            sitesMapView.addAnnotations(pinLocationsOnMap)
        }
        sitesMapView.reloadInputViews()
    }
}

// MARK: Extension's

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocation(latitude: 34.046960, longitude: -118.248278)
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 20000, longitudinalMeters: 20000)
        sitesMapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuth()
    }
}
