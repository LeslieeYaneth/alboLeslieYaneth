//
//  MapRouter.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit

protocol MapRoutingLogic {
}

protocol MapDataPassing {
    var dataStore: MapDataStore? { get }
}

class MapRouter: NSObject, MapRoutingLogic, MapDataPassing {
    // MARK: Properties
    weak var viewController: MapViewController?
    var dataStore: MapDataStore?
    // MARK: Routing Logic
}
