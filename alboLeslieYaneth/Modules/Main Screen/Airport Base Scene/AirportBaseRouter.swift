//
//  AirportBaseRouter.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit

@objc protocol AirportBaseRoutingLogic {
    func routeToHome()
    func routeToList()
}

class AirportBaseRouter: NSObject, AirportBaseRoutingLogic {
    // MARK: - Properties
    weak var viewController: AirportBaseViewController?
    weak var mapView: MapViewController!
    weak var listView: ListAirportsViewController!

    // MARK: Routing Logic
    func routeToHome() {
        guard let viewC = viewController else { return }
        mapView = UIStoryboard.main.instantiateViewController(withIdentifier: "MapVC") as? MapViewController
        mapView.view.frame = viewC.container.bounds
        viewC.addChildViewController(mapView)
        viewC.container.addSubview(mapView.view)
        mapView.didMove(toParentViewController: viewC)
    }

    func routeToList() {
        guard let viewC = viewController else { return }
        listView = UIStoryboard.main.instantiateViewController(withIdentifier: "ListAirportsVC") as? ListAirportsViewController
        listView.view.frame = viewC.container.bounds
        viewC.addChildViewController(listView)
        viewC.container.addSubview(listView.view)
        listView.didMove(toParentViewController: viewC)
    }
}
