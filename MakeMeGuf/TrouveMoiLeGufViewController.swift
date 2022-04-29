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

extension UIViewController{
    func showToast(message : String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
