//
//  PlayVideo.swift
//  MakeMeGuf
//
//  Created by Léna PANCHER on 28/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import AVKit
import AVFoundation
import Foundation


func playVideo(url: String, gifImageView: Any){
    // Create AVPlayer object
    let path = URL(string: url)!
    let asset = AVAsset(url: path)
    let playerItem = AVPlayerItem(asset: asset)
    let player = AVPlayer(playerItem: playerItem)
    
    // Create AVPlayerLayer object
    let playerLayer = AVPlayerLayer(player: player)
    playerLayer.frame = (gifImageView as AnyObject).bounds //bounds of the view in which AVPlayer should be displayed
    playerLayer.videoGravity = .resizeAspect
    
    // Add playerLayer to view's layer
    (gifImageView as AnyObject).layer.addSublayer(playerLayer)
    
    // Play Video
    player.play()
    
    // Loopinp
    NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { [weak self] _ in
        player.seek(to: CMTime.zero)
        player.play()
    }
}
