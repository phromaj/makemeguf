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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.randomLabel.text = searchGuf.randomElement()
    }

}
