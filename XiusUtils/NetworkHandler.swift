//
//  NetworkHandler.swift
//  Ubiqtrac
//
//  Created by Alexius Lim Li Liang on 31/03/2017.
//  Copyright © 2017 SAINS. All rights reserved.
//

import Foundation

struct NetworkHandler {
    
    func load<A>(resource: Resource<A>, completionHandler: @escaping (Result<A>) -> ()) {
        guard let url = resource.url else {
            fatalError(ErrorType.invalidUrl.description)
        }
        var request = URLRequest(url: url)
        request.httpMethod = resource.method.method
        
        // specify post request configuration
        // add data to httpBody
        if case let .post(data) = resource.method {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = data
        }
        
        // specify configuration
        let config = URLSessionConfiguration.ephemeral
        config.urlCache = nil
        config.requestCachePolicy = URLRequest.CachePolicy.reloadIgnoringCacheData
        let session = URLSession(configuration: config)
        
        // make network request
        session.dataTask(with: request) { data, response, error in
            // go to main thread after request complete
            DispatchQueue.main.async {
                if let error = error {
                    completionHandler(Result.failure(ErrorType.from(error: error)))
                    return
                }

                let result = data.flatMap(resource.parse)
                guard let r = result else {
                    completionHandler(Result.failure(.jsonError))
                    return
                }
                completionHandler(Result.success(r))
            }
        }.resume()
    }
    
    func load<A>(resource: Resource<A>, session: URLSession, completionHandler: @escaping (Result<A>) -> ()) {
        guard let url = resource.url else {
            fatalError(ErrorType.invalidUrl.description)
        }
        var request = URLRequest(url: url)
        request.httpMethod = resource.method.method
        
        // specify post request configuration
        // add data to httpBody
        if case let .post(data) = resource.method {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = data
        }
        
        // make network request
        session.dataTask(with: request) { data, response, error in
            // go to main thread after request complete
            DispatchQueue.main.async {
                if let error = error {
                    completionHandler(Result.failure(ErrorType.from(error: error)))
                    return
                }
                
                let result = data.flatMap(resource.parse)
                guard let r = result else {
                    completionHandler(Result.failure(.jsonError))
                    return
                }
                completionHandler(Result.success(r))
            }
        }.resume()
    }

    
    
}
