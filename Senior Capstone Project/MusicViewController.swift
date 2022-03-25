//
//  MusicViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 3/25/22.
//

import UIKit
import AVFoundation
var audioPlayer: AVAudioPlayer!
var sound: String?

class MusicViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sound = Bundle.main.path(forResource: "CoffeeJazz", ofType: "m4a")
                
        if let sound = sound {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            }
            catch{
                print(error)
            }
        }
        else{
            print("Error Retrieving Sound")
        }
        
        // Do any additional setup after loading the view.
    }
    
    var playing = false
    @IBOutlet weak var playButtonImage: UIImageView!
    
    @IBAction func playButtonTapped(_ sender: Any) {
        if playing == false{
            playButtonImage.image = UIImage(systemName: "pause.circle")
            audioPlayer.play()
        }
        else{
            playButtonImage.image = UIImage(systemName: "play.circle")
            audioPlayer.pause()
        }
        playing = !playing
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
