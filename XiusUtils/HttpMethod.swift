//
//  HttpMethod.swift
//  Ubiqtrac
//
//  Created by Alexius Lim Li Liang on 05/04/2017.
//  Copyright © 2017 SAINS. All rights reserved.
//

import Foundation

enum HttpMethod<Body> {
    case get
    case post(Body)
}

extension HttpMethod {
    var method:String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
    
    // B - is the generic where we specify the type we want to return
    // if .get return back get enum
    // if .post return post enum is data
    func map<B>(f: (Body) -> B) -> HttpMethod<B> {
        switch self {
        case .get: return .get
        case .post(let body):
            return .post(f(body))
        }
    }
}
