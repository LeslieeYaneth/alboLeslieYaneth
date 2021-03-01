//
//  MapInteractor.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit

protocol MapBusinessLogic {
    func requestAllAirports()
}

protocol MapDataStore {
    var airportsData: [ListAirportsModel] { get set }
}

class MapInteractor: MapBusinessLogic, MapDataStore {
    // MARK: Properties
    internal var presenter: MapPresentationLogic?
    private let worker = ListAirportsWorker()
    internal var airportsData = [ListAirportsModel]()

    // MARK: - Business Logic
    func requestAllAirports() {
        worker.getAllAirports().done { airports in
            Airports.AirportsData = airports
            let response = Map.GetAirports.Response(error: nil)
            self.presenter?.presentAirports(response)
        }.catch { error in
            let response = Map.GetAirports.Response(error: error)
            self.presenter?.presentAirports(response)
        }
    }
}
