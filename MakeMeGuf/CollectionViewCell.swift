//
//  CollectionViewCell.swift
//  MakeMeGuf
//
//  Created by Léna PANCHER on 28/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    func configure(with url: String) {
        DispatchQueue.main.async {
            self.playVideo(url: url)
        }
    }
    
    func playVideo(url: String){
        // Create AVPlayer object
        let path = URL(string: url)!
        let asset = AVAsset(url: path)
        let playerItem = AVPlayerItem(asset: asset)
        let player = AVPlayer(playerItem: playerItem)
        
        // Create AVPlayerLayer object
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.gifImageView.bounds //bounds of the view in which AVPlayer should be displayed
        playerLayer.videoGravity = .resizeAspect
        
        // Add playerLayer to view's layer
        self.gifImageView.layer.addSublayer(playerLayer)
        
        // Play Video
        player.play()
        
        // Loopinp
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            player.seek(to: CMTime.zero)
            player.play()
        }
    }
}
