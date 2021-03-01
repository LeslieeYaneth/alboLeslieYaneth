//
//  MapViewController.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit
import GoogleMaps

protocol MapDisplayLogic: class {
    func displayAirports(_ viewModel: Map.GetAirports.ViewModel)
}

class MapViewController: BaseViewController {
    // MARK: - Properties
    internal var interactor: (MapBusinessLogic & MapDataStore)?
    internal var router: (NSObjectProtocol & MapRoutingLogic & MapDataPassing)?
    // MARK: - Outlets

    // MARK: - Setup
    override func setup() {
        let viewController = self
        let interactor = MapInteractor()
        let presenter = MapPresenter()
        let router = MapRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor!.requestAllAirports()
        showMapView()
    }
    func showMapView() {
        let camera = GMSCameraPosition.camera(withLatitude: Location.LocationLatLog.latitude, longitude: Location.LocationLatLog.longitude, zoom: 12, bearing: 0, viewingAngle: 0)
        let mapView = GMSMapView.map(withFrame: CGRect(x: 10, y: 30, width: 10, height: 10), camera: camera)
        view = mapView
        let marker = GMSMarker(position: Location.LocationLatLog)
        marker.map = mapView
        for element in Airports.AirportsData {
            let markerAirport = GMSMarker(position: element.latLon)
            markerAirport.map = mapView
        }
    }

    func showAlert(msg: String) {
        let alert = UIAlertController(title: "Atención", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Display Logic Methods
extension MapViewController: MapDisplayLogic {
    func displayAirports(_ viewModel: Map.GetAirports.ViewModel) {
        if let msg = viewModel.errorMessage {
            showAlert(msg: msg)
        } else {
            showMapView()
        }
    }
}

