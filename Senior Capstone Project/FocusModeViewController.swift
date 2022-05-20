//
//  FocusModeViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 5/19/22.
//

import UIKit

var overallTime = 0.0

class FocusModeViewController: UIViewController {

    @IBOutlet var focusImage: UIImageView!
    @IBOutlet var circleImage: UIImageView!
    @IBOutlet var starsBG: UIImageView!
    @IBOutlet var mainTimeLabel: UILabel!
    @IBOutlet var todayTimeLabel: UILabel!
    @IBOutlet var overallTimeLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    var timer = Timer()
    var count = 0.0
    var timerStarted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let todayTime = HrsMinsSecs(seconds: Int(count))
        let todayTimeString = formatTimeSeconds(hours: todayTime.0, minutes: todayTime.1, seconds: todayTime.2)
        todayTimeLabel.text = "Today: " + todayTimeString
        
        overallTime += count
        
        let allTime = HrsMinsSecs(seconds: Int(overallTime))
        let overallTimeString = formatTimeSeconds(hours: allTime.0, minutes: allTime.1, seconds: allTime.2)
        overallTimeLabel.text = "Overall: " + overallTimeString
    }
    
    @IBAction func focusTap(_ sender: Any) {
        
        if timerStarted{
            timer.invalidate()
            UIView.animate(withDuration: 0.75){
                self.view.backgroundColor = #colorLiteral(red: 1, green: 0.7465914488, blue: 0.3282163143, alpha: 1)
                self.circleImage.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.focusImage.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.starsBG.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                self.mainTimeLabel.textColor = .black
                self.todayTimeLabel.textColor = .black
                self.overallTimeLabel.textColor = .black
                self.titleLabel.textColor = .black
            }
            focusImage.image = UIImage(systemName: "sun.max.fill")
            
            let todayTime = HrsMinsSecs(seconds: Int(count))
            let todayTimeString = formatTimeSeconds(hours: todayTime.0, minutes: todayTime.1, seconds: todayTime.2)
            todayTimeLabel.text = "Today: " + todayTimeString
            
            overallTime += count
            
            let allTime = HrsMinsSecs(seconds: Int(overallTime))
            let overallTimeString = formatTimeSeconds(hours: allTime.0, minutes: allTime.1, seconds: allTime.2)
            overallTimeLabel.text = "Overall: " + overallTimeString
            
        }
        else{
            count = 0
            UIView.animate(withDuration: 0.75){
                self.view.backgroundColor = #colorLiteral(red: 0.2674478292, green: 0.07376533002, blue: 0.674910605, alpha: 1)
                self.circleImage.tintColor = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
                self.focusImage.tintColor = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
                self.starsBG.tintColor = #colorLiteral(red: 0.9705293775, green: 1, blue: 0.95567137, alpha: 0.358228974)
                self.mainTimeLabel.textColor = .white
                self.todayTimeLabel.textColor = .white
                self.overallTimeLabel.textColor = .white
                self.titleLabel.textColor = .white
            }
            focusImage.image = UIImage(systemName: "moon.fill")
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
        
        timerStarted = !timerStarted
        
    }
    
    @objc func timerCounter() -> Void {
        count += 1
        
        let time = HrsMinsSecs(seconds: Int(count))
        let timeString = formatTimeSeconds(hours: time.0, minutes: time.1, seconds: time.2)
        mainTimeLabel.text = timeString
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
