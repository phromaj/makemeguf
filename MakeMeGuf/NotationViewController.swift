//
//  NotationViewController.swift
//  MakeMeGuf
//
//  Created by Léna PANCHER on 28/04/2022.
//  Copyright © 2022 guf. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class NotationViewController: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var phrasePlayerLabel: UILabel!
    @IBOutlet weak var scoreField: UITextField!
    
    var text: String = ""
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Note"
        phrasePlayerLabel.text = "\"" + text + "\""
        DispatchQueue.main.async { [self] in
            self.playVideo(url: self.url)
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
    
    
    @IBAction func toResultButton(_ sender: Any) {
        print(self.scoreField.text!)
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "result") as? ResultViewController {
            if self.scoreField.text != "" {
                vc.result = self.scoreField.text!
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func score(_ sender: UITextField) {
        if !(sender.text!.isEmpty) && Int(sender.text!)! > 10  {
            sender.text! = "10"
        }
    }
}
