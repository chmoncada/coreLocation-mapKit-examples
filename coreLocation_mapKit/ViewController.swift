//
//  ViewController.swift
//  coreLocation_mapKit
//
//  Created by Charles Moncada on 15/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

	@IBOutlet weak var latitudeLabel: UILabel!
	@IBOutlet weak var longitudeLabel: UILabel!
	let locationManager = CLLocationManager()

	override func viewDidLoad() {
		super.viewDidLoad()
		locationManager.delegate = self
		locationManager.requestWhenInUseAuthorization()
		locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters

	}

	@IBAction func updateLocation(_ sender: Any) {
		if CLLocationManager.locationServicesEnabled() {
			locationManager.requestLocation()
		}
	}
}

extension ViewController: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		if let location = locations.last {
			latitudeLabel.text = "\(location.coordinate.latitude)"
			longitudeLabel.text = "\(location.coordinate.longitude)"
		}
	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("No pude conseguir la ubicacion del usuario: \(error.localizedDescription)")
	}
}

