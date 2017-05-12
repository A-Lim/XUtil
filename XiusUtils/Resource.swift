//
//  Resource.swift
//  Ubiqtrac
//
//  Created by Alexius Lim Li Liang on 05/04/2017.
//  Copyright © 2017 SAINS. All rights reserved.
//

import Foundation

struct Resource<A> {
    let urlStr:String
    let params:JSONDictionary
    let method:HttpMethod<Data?>
    let parse:(Data) -> A?
    
    // computed property
    // takes in urlStr and params
    // if method is Post, then ignore the param and just convert the urlStr to URL
    // if method is Get, concatenate the urlStr and the parameters
    var url: URL? {
        if method.method == "POST" {
            return URL(string: urlStr)
        }
        return URL(string: "\(urlStr)\(escapedParameters(params))")
    }
    
    // convert a JSONDictionary into a url string with urlAllowedCharacters
    private func escapedParameters(_ parameters: JSONDictionary) -> String {
        var keyValuePairs = [String]()
        for (key, value) in parameters {
            let valueStr = String(describing: value)
            
            // returns characters that are safe ASCII
            let escapeValue = valueStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            keyValuePairs.append(key + "=" + escapeValue!)
        }
        return "?\(keyValuePairs.joined(separator: "&"))"
    }
}

extension Resource {
    init(urlStr: String, params: JSONDictionary, method: HttpMethod<Any> = .get, parseJSON: @escaping (Any) -> A?) {
        self.urlStr = urlStr
        self.params = params
        
        // returns .get or .post
        // if .post it is accompanied with data (.post(data))
        self.method = method.map(f: { json -> Data? in
            return try? JSONSerialization.data(withJSONObject: json, options: [])
        })
        
        // convert data into JSON
        // flatMap to remove nil values
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            return json.flatMap(parseJSON)
        }
    }
}
