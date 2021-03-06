//
//  ApiHandler.swift
//  MakeMeGuf
//
//  Created by admin on 27/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import Foundation
typealias CompletionHandler = (_ tenor: Tenor) -> Void
let apikey = "I28HR6RDU71N"


func requestData(searchTerm: String, completion: @escaping CompletionHandler) {
    
    let searchRequest: URLRequest
    
    if searchTerm != "random"{
        searchRequest = URLRequest(url: URL(string: String(format: "https://g.tenor.com/v1/search?q=%@&key=%@&limit=%d&media_filter=mp4",
                                                           searchTerm,
                                                           apikey,
                                                           50))!)
    } else {
        searchRequest = URLRequest(url: URL(string: String(format: "https://g.tenor.com/v1/random?key=%@&limit=%d&media_filter=mp4",
                                                           apikey,
                                                           8))!)
    }
    
    // Make the async request and pass the resulting json object to the callback
    let task = URLSession.shared.dataTask(with: searchRequest, completionHandler:  { (data, response, error) in
        do {
            if (try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]) != nil {
                let tenor =  parse(json: data!)
                completion(tenor)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    })
    task.resume()
}


func parse(json: Data) -> Tenor {
    let decoder = JSONDecoder()
    if let tenor = try? decoder.decode(Tenor.self, from: json) {
        return tenor
    }
    return Tenor(results: [], next: "")

}


