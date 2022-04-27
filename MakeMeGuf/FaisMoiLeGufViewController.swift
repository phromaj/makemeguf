//
//  FaisMoiLeGufViewController.swift
//  MakeMeGuf
//
//  Created by Léna PANCHER on 26/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import UIKit


class FaisMoiLeGufViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestData(searchTerm: "angry") { (Tenor) in
            print(Tenor)
        }
        
                
        self.title = "Fais moi l'guf"
        
    }
    
}
