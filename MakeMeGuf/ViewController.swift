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
