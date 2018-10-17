//
//  MapKitViewController.swift
//  coreLocation_mapKit
//
//  Created by Charles Moncada on 15/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {

	var pointsOfInterest: [PointOfInterest] = []

	let locationManager = CLLocationManager()

	@IBOutlet weak var mapView: MKMapView!


	override func viewDidLoad() {
		super.viewDidLoad()

		let cibeles = CLLocationCoordinate2D(latitude: 40.4192500, longitude: -3.6932700)
		let regionRadius: CLLocationDistance = 1000

		let region = MKCoordinateRegion(center: cibeles, latitudinalMeters: regionRadius, longitudinalMeters: 1000)

		mapView.setRegion(region, animated: true)
		mapView.delegate = self

	}

	private func loadPointsOfInterest() {
		let cibeles = PointOfInterest(name: "Plaza de Cibeles", info: "A visitar", location: CLLocationCoordinate2D(latitude: 40.4192500, longitude: -3.6932700))

		pointsOfInterest.append(cibeles)
	}
}

extension MapKitViewController: MKMapViewDelegate {

	func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
		print("rendering")
	}

	func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
		// cargar puntos de interes
		loadPointsOfInterest()
		mapView.addAnnotations(pointsOfInterest)
	}

	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		if annotation is MKUserLocation {
			return nil
		}

		var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "pointOfInterest") as? MKMarkerAnnotationView

		if annotationView == nil {
			annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "pointOfInterest")
		} else {
			annotationView?.annotation = annotation
		}

		annotationView?.markerTintColor = .green
		annotationView?.titleVisibility = .visible
		annotationView?.subtitleVisibility = .adaptive

		return annotationView
	}
}

