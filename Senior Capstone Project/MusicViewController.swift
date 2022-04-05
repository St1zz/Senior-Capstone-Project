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

var currentStation = musicStations[0]
var stationNum = 0
var currentSongNum = 0

class MusicViewController: UIViewController {
    
    @IBOutlet weak var playButtonImage: UIImageView!
    @IBOutlet weak var stationImage: UIImageView!
    @IBOutlet weak var stationName: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!

    // Change Song
    func ChangeSong(goNext:Bool){
        let songCount = currentStation.songs.count
        
        if goNext == true{
            if currentSongNum == songCount - 1{
                currentSongNum = 0
            }else{
                currentSongNum += 1
            }
        }
        else{
            if currentSongNum == 0{
                currentSongNum = songCount - 1
            }else{
                currentSongNum -= 1
            }
        }
       print(currentSongNum)
        let nextSong = currentStation.songs[currentSongNum]
        let fileName = nextSong.fileName
        let fileType = nextSong.fileType
        
        songNameLabel.text = nextSong.name
        artistLabel.text = nextSong.artist
        
        sound = Bundle.main.path(forResource: fileName, ofType: fileType)
        
        if let sound = sound {
            do {
                audioPlayer.stop()
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
                
                if playing == true{
                    audioPlayer.play()
                }
                
            }
            catch{
                print("Error Setting AudioPlayer")
                print(error)
            }
        }
        else{
            print("Error Retrieving Sound")
        }
        
    }
    
    // Change Station
    func SetStation(goNext: Bool?){
        
        if let goNext = goNext{
            print("nextin")
            let stationCount = musicStations.count
            
            if goNext == true{
                
                if stationNum == stationCount - 1{
                    stationNum = 0
                }else{
                    stationNum += 1
                }
                
            }
            else{
                if stationNum == 0{
                    stationNum = stationCount - 1
                }else{
                    stationNum -= 1
                }
            }
        }
        
        currentStation = musicStations[stationNum]
        
        stationName.text = currentStation.name
        stationImage.image = currentStation.image
        
        let songCount = currentStation.songs.count
        let randomNum = Int.random(in: 0..<songCount - 1)
        let randomSong = currentStation.songs[randomNum]
        currentSongNum = randomNum
        
        let fileName = randomSong.fileName
        let fileType = randomSong.fileType
        
        songNameLabel.text = randomSong.name
        artistLabel.text = randomSong.artist
        
        sound = Bundle.main.path(forResource: fileName, ofType: fileType)
        
        if let sound = sound {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
                
                if playing == true{
                    audioPlayer.play()
                }
            }
            catch{
                print("Error Setting AudioPlayer")
                print(error)
            }
        }
        else{
            print("Error Retrieving Sound")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SetStation(goNext: nil)
        
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
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        ChangeSong(goNext: true)
    }
    
    @IBAction func lastButtonTapped(_ sender: Any) {
        ChangeSong(goNext: false)
    }
    
    @IBAction func rightSwipe(_ sender: Any) {
        print("Last Station")
        SetStation(goNext: false)
    }
    
    @IBAction func leftSwipe(_ sender: Any) {
        print("Next Station")
        SetStation(goNext: true)
    }
    
}
