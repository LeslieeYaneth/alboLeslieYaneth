//
//  MainFeedInteractor.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit

protocol MainFeedBusinessLogic {
    func requestUserLocation()
}

protocol MainFeedDataStore {
}

class MainFeedInteractor: MainFeedBusinessLogic, MainFeedDataStore {
    // MARK: Properties
    internal var presenter: MainFeedPresentationLogic?
    private let worker = ListAirportsWorker()

    // MARK: - Business Logic
    func requestUserLocation() {
        worker.getUserLocation().done { location in
            Location.LocationLatLog = location!.coordinate
            Location.LocationUs = String(location!.coordinate.latitude) + "," + String(location!.coordinate.longitude)
        }.catch { error in
        }
    }
}
