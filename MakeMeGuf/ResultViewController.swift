//
//  ResultViewController.swift
//  MakeMeGuf
//
//  Created by Léna PANCHER on 28/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var critiqueLabel: UILabel!
    
    var result: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setCritiqueText(critique: result)
        
        self.scoreLabel.text! = result + "/10"

    }
    
    private func setCritiqueText(critique: String){
        let score: Int = Int(critique)!
        
        if score < 3 {
            self.critiqueLabel.text! = "Pitoyable"
        } else if score < 7 {
            self.critiqueLabel.text! = "Nul"
        } else {
            self.critiqueLabel.text! = "ok boomer"
        }
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") as? ViewController {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
