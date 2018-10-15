//
//  PointOfInterest.swift
//  coreLocation_mapKit
//
//  Created by Charles Moncada on 15/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import UIKit

class PointOfInterest: NSObject {
	let name: String
	let info: String

	init(name: String, info: String) {
		self.name = name
		self.info = info
	}
}

