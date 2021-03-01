//
//  MainFeedRouter.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit

protocol MainFeedRoutingLogic {
    func routeToAirports()
}

protocol MainFeedDataPassing {
    var dataStore: MainFeedDataStore? { get }
}

class MainFeedRouter: NSObject, MainFeedRoutingLogic, MainFeedDataPassing {
    // MARK: Properties
    weak var viewController: MainFeedViewController?
    var dataStore: MainFeedDataStore?

    // MARK: Routing Logic
    func routeToAirports() {
        guard let viewC = viewController else { return }
        // Comida
        let comidaMain = UIStoryboard.main.instantiateViewController(withIdentifier: "AirportBaseVC") as! AirportBaseViewController
        let navController = UINavigationController(rootViewController: comidaMain)
        viewC.present(navController, animated: true, completion: nil)
    }
}
