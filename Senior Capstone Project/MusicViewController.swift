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
        
        let fileName = lofiStudy.songs[0].fileName
        let fileType = lofiStudy.songs[0].fileType
        
        print(fileName)
        print(fileType)
        
        sound = Bundle.main.path(forResource: fileName, ofType: fileType)
        
        if let sound = sound {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            }
            catch{
                print("Error Setting AudioPlayer")
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
