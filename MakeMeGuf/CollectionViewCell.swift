//
//  CollectionViewCell.swift
//  MakeMeGuf
//
//  Created by Léna PANCHER on 28/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var countryNamelLabel: UILabel!
    
    func configure(with countryName: String) {
        countryNamelLabel.text = countryName
    }
}
