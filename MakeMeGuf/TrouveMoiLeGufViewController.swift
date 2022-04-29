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
    var tabUrls = [String]()
    var choiceUrl = ""
    
    let serialDispatchQueue = DispatchQueue(label: "serial-dispatch-queue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trouve moi l'guf"
        self.randomLabel.text = searchGuf.randomElement()
    }
    
    @IBAction func searchButton(_ sender: Any) {
        if self.searchInput.text!.isEmpty {
            showToast(message: "Entre un mot espece de guf !", seconds: 1.0)
            self.tabUrls = []
        } else {
            self.serialDispatchQueue.async {
                requestData(searchTerm: self.searchInput.text!) { tenor in
                    let count = 1...10
                    self.tabUrls = []
                    for number in count {
                        self.tabUrls.append(tenor.results[number].media[0]["mp4"]!.url)
                    }
                    DispatchQueue.main.async {
                        self.navigateToGif()
                    }
                }
            }
        }
    }
    
    func navigateToGif(){
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "collection") as? CollectionViewController {
            vc.tabUrls = self.tabUrls
            vc.textRandom = randomLabel.text!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
