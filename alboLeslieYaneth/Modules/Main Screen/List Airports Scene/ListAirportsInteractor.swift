//
//  ListAirportsInteractor.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit

protocol ListAirportsBusinessLogic {
}

protocol ListAirportsDataStore {
}

class ListAirportsInteractor: ListAirportsBusinessLogic, ListAirportsDataStore {
    // MARK: Properties
    internal var presenter: ListAirportsPresentationLogic?
    // MARK: - Business Logic
}
