//
//  TrouveMoiLeGufViewController.swift
//  MakeMeGuf
//
//  Created by Léna PANCHER on 26/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import UIKit

class TrouveMoiLeGufViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Trouve moi l'guf"
        
        requestData(searchTerm: "") { (Tenor) in
            
        }
    }
    

}
