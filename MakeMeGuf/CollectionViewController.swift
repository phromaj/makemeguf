//
//  CollectionViewController.swift
//  MakeMeGuf
//
//  Created by Léna PANCHER on 28/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let dataSouce: [String] = ["USA", "Bresil", "France", "Mexique", "Allemagne", "Autriche", "Pologne"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSouce.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let countryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            countryCell.configure(with: dataSouce[indexPath.row])
            
            cell = countryCell
            
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    
        print("Selected country : " + dataSouce[indexPath.row]) 
        
    }

}
