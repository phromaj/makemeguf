//
//  FaisMoiLeGufViewController.swift
//  MakeMeGuf
//
//  Created by Léna PANCHER on 26/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class FaisMoiLeGufViewController: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!
    var urlRandom = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Fais moi l'guf"
        
        requestData(searchTerm: "random") { [self] (Tenor) in
            
            self.urlRandom = Tenor.results.randomElement()!.media[0]["mp4"]!.url
            
            DispatchQueue.main.async {
                self.playVideo(url: self.urlRandom)
            }
        }
        
        // Add a tap gesture on imageView (gif)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        gifImageView.isUserInteractionEnabled = true
        gifImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Function linked to the tap gesture that activates the full screen
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        fullscreenMode(url: self.urlRandom)
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
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { [weak self] _ in
            player.seek(to: CMTime.zero)
            player.play()
        }
    }
    
    func fullscreenMode(url: String) {
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let path = URL(string: url)!
        let player2 = AVPlayer(url: path)
        
        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player2
        
        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player2.play()
        }
    }
    
    
}
