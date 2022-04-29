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
var songswitched = false

class MusicViewController: UIViewController {
    
    @IBOutlet weak var playButtonImage: UIImageView!
    @IBOutlet weak var stationImage: UIImageView!
    @IBOutlet weak var stationName: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    
    // Change Song
    func ChangeSong(goNext:Bool){
        let songCount = currentStation.songs.count
        songswitched = false
        
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
                lengthLabel.text = getTime(timeInt: audioPlayer.duration)
                if playing == true{
                    audioPlayer.play()
                    musicSlider.value = 0
                    musicSlider.maximumValue = Float(audioPlayer.duration)
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
                lengthLabel.text = getTime(timeInt: audioPlayer.duration)
                
                if playing == true{
                    audioPlayer.play()
                    musicSlider.value = 0
                    musicSlider.maximumValue = Float(audioPlayer.duration)
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
    
    func getTime(timeInt: TimeInterval) -> String{
        
        let mins = timeInt/60
        let secs = timeInt.truncatingRemainder(dividingBy: 60)
        let timeFormatter = NumberFormatter()
        timeFormatter.minimumIntegerDigits = 2
        timeFormatter.minimumFractionDigits = 0
        timeFormatter.roundingMode = .down
        
        guard let minsString = timeFormatter.string(from: NSNumber(value: mins)), let secString = timeFormatter.string(from: NSNumber(value: secs))
        else{
            return "00:00"
        }
        
        return "\(minsString):\(secString)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SetStation(goNext: nil)
        
        let _ = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(UpdateSlider), userInfo:nil, repeats:true)

        // Do any additional setup after loading the view.
    }
    
    @objc func UpdateSlider(){
        musicSlider.value = Float(audioPlayer.currentTime)
        let timeLeft = audioPlayer.currentTime
        progressLabel.text = getTime(timeInt: timeLeft)
       
        if audioPlayer.currentTime >
            audioPlayer.duration - 0.1 && songswitched == false {
            songswitched = true
            ChangeSong(goNext: true)
        }
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        if playing == false{
            playButtonImage.image = UIImage(systemName: "pause.circle")
            audioPlayer.play()
            musicSlider.value = 0
            musicSlider.maximumValue = Float(audioPlayer.duration)
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
        SetStation(goNext: false)
    }
    
    @IBAction func leftSwipe(_ sender: Any) {
        SetStation(goNext: true)
    }
    
    @IBAction func musicSliderMove(_ sender: Any) {
        
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(musicSlider.value)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
    
    
}
