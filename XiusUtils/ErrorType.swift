//
//  ErrorType.swift
//  Ubiqtrac
//
//  Created by Alexius Lim Li Liang on 05/04/2017.
//  Copyright © 2017 SAINS. All rights reserved.
//

import Foundation

enum ErrorType {
    case noInternet
    case jsonError
    case pageNotFound
    case invalidServerResponse
    case noResponse
    case noData
    case invalidUrl
    case unknown
    case timedOut
    case connectServerFail
    
    var description: String {
        var desc = ""
        switch self {
        case .noInternet:
            desc = "No internet connection"
        case .jsonError:
            desc = "Invalid json"
        case .pageNotFound:
            desc = "Page not found"
        case .invalidServerResponse:
            desc = "Invalid server response"
        case .noResponse:
            desc = "No response from server"
        case .noData:
            desc = "No data"
        case .invalidUrl:
            desc = "Invalid URL"
        case .unknown:
            desc = "Unknown Error"
        case .timedOut:
            desc = "Request Timed Out"
        case .connectServerFail:
            desc = "Could not connect to the server"
        default:
            break
        }
        
        return desc
    }
}

extension ErrorType {
    static func from(error:Error) -> ErrorType {
        let e = error as NSError
        switch e.code {
        case -1009:
            return .noInternet
        case -1011:
            return .invalidServerResponse
        case -1001:
            return .timedOut
        case -1004:
            return .connectServerFail
        default:
            return .unknown
        }
    }
}
