//
//  CollectionViewController.swift
//  MakeMeGuf
//
//  Created by Léna PANCHER on 28/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class CollectionViewController: UICollectionViewController {
    
    var tabUrls = [String]()
    var choiceUrl = ""
    var textRandom = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabUrls.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if let gifCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            gifCell.configure(with: tabUrls[indexPath.row])
            cell = gifCell
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.choiceUrl = tabUrls[indexPath.row]
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "notation") as? NotationViewController {
            vc.url = choiceUrl
            vc.text = self.textRandom
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
}
