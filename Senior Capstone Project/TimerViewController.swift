//
//  TimerViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 5/5/22.
//

import UIKit

private var timerPlaying = false

func HrsMinsSecs(seconds:Int) -> (Int,Int,Int){
    return ((seconds/3600), ((seconds % 3600) / 60 ), ((seconds % 3600) % 60))
}

func formatTimeSeconds(hours:Int, minutes:Int, seconds:Int) -> String{
    var timeString = ""
    timeString += String(format: "%02d", hours)
    timeString += " : "
    if timeString == "00 : "{
        timeString = ""
    }
    timeString += String(format: "%02d", minutes)
    timeString += " : "
    if timeString == "00 : 00 : "{
        timeString = ""
    }
    timeString += String(format: "%02d", seconds)
    return timeString
}

class TimerViewController: UIViewController {
    
    var timer = Timer()
    var firstCount = 0.0
    var count = 0.0
    
    var timerInfo:newTimer?
    @IBOutlet var timerName: UILabel!
    @IBOutlet var timerCircle: UIImageView!
    @IBOutlet var timeDisplay: UILabel!
    
    @IBOutlet var startLabel: UILabel!
    @IBOutlet var resetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startLabel.layer.cornerRadius = 20
        resetLabel.layer.cornerRadius = 20
        timerPlaying = false
        
        if let timerInfo = timerInfo {
            
            timerName.text = timerInfo.name
            timerCircle.tintColor = timerInfo.color
            let duration = HrsMinsSecs(seconds: Int(timerInfo.duration))
            
            let durationString = formatTimeSeconds(hours: duration.0, minutes: duration.1, seconds: duration.2)
            
            timeDisplay.text = durationString
            
            firstCount = timerInfo.duration
            count = timerInfo.duration
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startTap(_ sender: Any) {
      
        timerPlaying = !timerPlaying
        
        if timerPlaying == true{
            startLabel.text = "Pause"
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            
        }else{
            startLabel.text = "Resume"
            timer.invalidate()
        }
    }
    
    @objc func timerCounter() -> Void {
        count -= 1
        if count >= 0{
            let time = HrsMinsSecs(seconds: Int(count))
            let timeString = formatTimeSeconds(hours: time.0, minutes: time.1, seconds: time.2)
            timeDisplay.text = timeString
        }else{
            timer.invalidate()
        }
    }
    
    @IBAction func resetTap(_ sender: Any) {
        timer.invalidate()
        let time = HrsMinsSecs(seconds: Int(firstCount))
        let timeString = formatTimeSeconds(hours: time.0, minutes: time.1, seconds: time.2)
        timeDisplay.text = timeString
        timerPlaying = false
        startLabel.text = "Start"
        count = firstCount
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
