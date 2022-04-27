//
//  TrouveMoiLeGufViewController.swift
//  MakeMeGuf
//
//  Created by Léna PANCHER on 26/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import UIKit

class TrouveMoiLeGufViewController: UIViewController {

    let searchGuf = ["This is fine", "Wat", "One Does Not Simply Walk Into Mordor","Shut Up And Take My Money!", "Ah Shit, Here We Go Again"]
    
    @IBOutlet weak var randomLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.randomLabel.text = searchGuf.randomElement()

    }
    

}
