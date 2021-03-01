//
//  AirportsModels.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit
import SwiftyJSON
import CoreLocation

struct ListAirportsModel {
    // MARK: Properties
    let type: String!
    let name: String!
    let latLon: CLLocationCoordinate2D!

    // MARK: - Init
    init(fromJSON json: JSON) {
        type = json["type"].stringValue
        name = json["name"].stringValue
        latLon = CLLocationCoordinate2D(latitude: json["lat"].doubleValue, longitude: json["lon"].doubleValue)
    }
}

struct FinderKm {
    static var FinderString = ""
}

struct Location {
    static var LocationUs = ""
    static var LocationLatLog = CLLocationCoordinate2D()
}

struct Airports {
    static var AirportsData = [ListAirportsModel]()
}
