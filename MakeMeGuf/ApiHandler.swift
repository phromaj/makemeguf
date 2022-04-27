//
//  ApiHandler.swift
//  MakeMeGuf
//
//  Created by admin on 27/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import Foundation

let apikey = "I28HR6RDU71N"

/**
 Execute web request to retrieve the top GIFs returned(in batches of 8) for the given search term.
 */
func requestData(searchTerm: String, completion: @escaping (Tenor) -> Void)
{
    // Define the results upper limit
    let limit = 8
    
    let searchRequest: URLRequest
    
    if searchTerm != "random"{
        searchRequest = URLRequest(url: URL(string: String(format: "https://g.tenor.com/v1/search?q=%@&key=%@&limit=%d",
                                                           searchTerm,
                                                           apikey,
                                                           limit))!)
    } else {
        searchRequest = URLRequest(url: URL(string: String(format: "https://g.tenor.com/v1/random?key=%@&limit=%d",
                                                           apikey,
                                                           limit))!)
    }
    
    // Make the async request and pass the resulting json object to the callback
    let task = URLSession.shared.dataTask(with: searchRequest, completionHandler:  { (data, response, error) in
        do {
            if (try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]) != nil {
                // Push the results to our callback
                
                let tenor =  parse(json: data!)
                
                completion(tenor)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    })
    task.resume()
    
    // make initial search request for the first 8 items
    
    
    
    
    // Data will be loaded by each request's callback
}

func parse(json: Data) -> Tenor {
    
    
    let decoder = JSONDecoder()
    
    if let tenor = try? decoder.decode(Tenor.self, from: json) {

        return tenor
    }
    
    return Tenor(results: [], next: "")
    
}
