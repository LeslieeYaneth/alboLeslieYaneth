//
//  AlboLeslieAPI.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import Foundation
import Alamofire

enum AlboLeslieAPI {
    // Login Endpoints
    case getListAirports(latLon: String, maxResults: String)
}

// MARK: - Endpoint Declaration
extension AlboLeslieAPI: APIEndpoint {

    var baseURL: String! {
        switch self {

        default:
            return AlboLeslieURLS.restURL
        }
    }

    var path: String! {
        switch self {

        // Login Endpoints
        case .getListAirports(let latLon, _):
            return "nearest/\(latLon)/"
        }
    }

    var method: HTTPMethod! {
        switch self {

        default:
            return .get
        }
    }

    var headers: HTTPHeaders! {
        return ["X-RapidAPI-Key": AlboLeslieURLS.apiKey,
                "X-rapidapi-host": AlboLeslieURLS.apiHost]
    }

    var parameters: [String: Any]? {
        switch self {

        case .getListAirports(_, let maxResults):
            return ["maxResults": maxResults]

        default:
            return nil
        }
    }

    var parameterEncoding: ParameterEncoding! {
        return URLEncoding.default
    }
}

