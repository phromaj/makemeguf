//
//  ViewController.swift
//  MakeMeGuf
//
//  Created by admin on 26/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func faisMoiLeGufButton(_ sender: Any) {
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "faisMoiLeGuf") as? FaisMoiLeGufViewController {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func trouveMoiLeGufButton(_ sender: Any) {
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "trouveMoiLeGuf") as? TrouveMoiLeGufViewController {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

