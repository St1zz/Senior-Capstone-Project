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
var playing = false

let stations = MusicStations()
let lofiStudy = stations.lofiStudy

class MusicViewController: UIViewController {
    
    @IBOutlet weak var playButtonImage: UIImageView!
    @IBOutlet weak var stationImage: UIImageView!
    @IBOutlet weak var stationName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stationName.text = lofiStudy.name
        stationImage.image = lofiStudy.image
        
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
    
}
