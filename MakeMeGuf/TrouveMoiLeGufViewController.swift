//
//  TrouveMoiLeGufViewController.swift
//  MakeMeGuf
//
//  Created by Léna PANCHER on 26/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import UIKit

class TrouveMoiLeGufViewController: UIViewController {

    @IBOutlet weak var randomLabel: UILabel!
    @IBOutlet weak var searchInput: UITextField!
    
    @IBAction func searchAction(_ sender: Any) {
        print(searchInput.text!)
        requestData(searchTerm: searchInput.text!) { (Tenor) in
            for result in Tenor.results {
                print(result.media[0]["mp4"]!.url)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.randomLabel.text = searchGuf.randomElement()
    }

}
