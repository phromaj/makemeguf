//
//  ApiHandler.swift
//  MakeMeGuf
//
//  Created by admin on 27/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import Foundation

let apikey = "I28HR6RDU71N"

var Results: [Result] = []


/**
 Execute web request to retrieve the top GIFs returned(in batches of 8) for the given search term.
 */
func requestData(searchTerm: String)
{
  // Define the results upper limit
  let limit = 8

  // make initial search request for the first 8 items
  let searchRequest = URLRequest(url: URL(string: String(format: "https://g.tenor.com/v1/search?q=%@&key=%@&limit=%d",
                                                           searchTerm,
                                                           apikey,
                                                           limit))!)

  makeWebRequest(urlRequest: searchRequest, callback: tenorSearchHandler)

  // Data will be loaded by each request's callback
}

/**
 Async URL requesting function.
 */
func makeWebRequest(urlRequest: URLRequest, callback: @escaping ([String:AnyObject]) -> ())
{
  // Make the async request and pass the resulting json object to the callback
  let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
    do {
        if (try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]) != nil {
        // Push the results to our callback
        parse(json: data!)
        //callback(jsonResult)
      }
    } catch let error as NSError {
      print(error.localizedDescription)
    }
  }
  task.resume()
}

/**
 Web response handler for search requests.
 */
func tenorSearchHandler(response: [String:AnyObject])
{
  // Parse the json response
  let responseGifs = response["results"]!

  // Load the GIFs into your view
  print("Result GIFS: \(responseGifs)")

}

func parse(json: Data) {
    
    
    let decoder = JSONDecoder()

    if let jsonPetitions = try? decoder.decode(Tenor.self, from: json) {
        Results = jsonPetitions.results
    }
    
    //print(results[0].media[0]["mp4"]!.url)
}
