//
//  MusicSlideViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 3/7/22.
//

import UIKit
import AVFoundation
var player: AVAudioPlayer?

class MusicSlideViewController: UIViewController {

    @IBOutlet weak var playButtonImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playButton(_ sender: Any) {
        
        if let player = player, player.isPlaying {
                // stop playback
            player.stop()
            playButtonImage.image = UIImage(systemName: "play.circle")
        }
        else{
            playButtonImage.image = UIImage(systemName: "pause.circle")
            // setup & play
            let testAudio = Bundle.main.path(forResource: "01 Coffee & Jazz", ofType: "mp3")
                
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
               
                guard let testAudio = testAudio else {
                    return
                }

                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: testAudio))
                    
                guard let player = player else {
                    return
                }

                player.play()
                    
            }
            catch{
                print("error occured")
            }
                
        }
               
            
    }
}
