//
//  PointOfInterest.swift
//  coreLocation_mapKit
//
//  Created by Charles Moncada on 15/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import UIKit
import MapKit

class PointOfInterest: NSObject {
	let name: String
	let info: String
	let location: CLLocationCoordinate2D

	init(name: String, info: String, location: CLLocationCoordinate2D) {
		self.name = name
		self.info = info
		self.location = location
	}
}

extension PointOfInterest: MKAnnotation {
	var coordinate: CLLocationCoordinate2D {
		get {
			return location
		}
	}

	var title: String? {
		get {
			return name
		}
	}

	var subtitle: String? {
		get {
			return info
		}
	}

}

