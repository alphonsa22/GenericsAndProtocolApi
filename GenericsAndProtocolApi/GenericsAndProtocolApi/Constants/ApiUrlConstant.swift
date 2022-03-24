//
//  ApiUrlConstant.swift
//  GenericsAndProtocolApi
//
//  Created by Alphonsa Varghese on 23/03/22.
//

import Foundation

struct AppUrl {
    enum BaseUrl: String {
        case dev = "https://cat-fact.herokuapp.com"
        case live = "https://cat-fact.herokuapp.com/"
    }

    enum Endpoint: String {
        case fact = "/facts"
        case random = "/facts/random"
    }
    
    enum Method: String {
        case GET
        case POST
        case DELETE
    }
    
    enum APIError: Error {
        case internalError
        case serverError
        case parsingError
    }
}

