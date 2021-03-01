//
//  MapPresenter.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit

protocol MapPresentationLogic {
    func presentAirports(_ response: Map.GetAirports.Response)
}

class MapPresenter: MapPresentationLogic {
    // MARK: - Properties
    weak var viewController: MapDisplayLogic?
    // MARK: - Presentation Logic
    func presentAirports(_ response: Map.GetAirports.Response) {
        let viewModel = Map.GetAirports.ViewModel(errorMessage: response.error?.localizedDescription)
        viewController?.displayAirports(viewModel)
    }
}
