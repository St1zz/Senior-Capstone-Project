//
//  TimerViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 5/5/22.
//

import UIKit

class TimerViewController: UIViewController {

    var timerInfo:newTimer?
    @IBOutlet var timerName: UILabel!
    @IBOutlet var timerCircle: UIImageView!
    @IBOutlet var timeDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let timerInfo = timerInfo {
            
            timerName.text = timerInfo.name
            timerCircle.tintColor = timerInfo.color
            timeDisplay.text = formatTime(time: timerInfo.duration)
            
        }
        // Do any additional setup after loading the view.
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
