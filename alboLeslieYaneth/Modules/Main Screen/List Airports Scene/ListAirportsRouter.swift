//
//  ListAirportsRouter.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit

protocol ListAirportsRoutingLogic {
}

protocol ListAirportsDataPassing {
    var dataStore: ListAirportsDataStore? { get }
}

class ListAirportsRouter: NSObject, ListAirportsRoutingLogic, ListAirportsDataPassing {
    // MARK: Properties
    weak var viewController: ListAirportsViewController?
    var dataStore: ListAirportsDataStore?
    // MARK: Routing Logic
}

