//
//  ListAirportsWorker.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//
import PromiseKit
import SwiftyJSON

class ListAirportsWorker {

    // MARK: Properties
    private let backQueue = DispatchQueue.global(qos: .userInitiated)

    func getUserLocation() -> Promise<CLLocation?> {
        return CLLocationManager.requestLocation().then { locArray -> Promise<CLLocation?> in
            return .value(locArray.first)
        }
    }

    func getAllAirports() -> Promise<[ListAirportsModel]> {
        let req = NetworkManager.request(endpoint: AlboLeslieAPI.getListAirports(latLon: Location.LocationUs, maxResults: FinderKm.FinderString))
        return req.then(on: backQueue) { json -> Promise<[ListAirportsModel]> in
            var airportsArray = [ListAirportsModel]()
            for (_, element) in json["results"] {
                airportsArray.append(ListAirportsModel(fromJSON: element))
            }
            return .value(airportsArray)
        }
    }
}
