//
//  MapUseCases.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit

enum Map {
    struct GetAirports {
        struct Response {
            let error: Error?
        }

        struct ViewModel {
            let errorMessage: String?
        }
    }
}
