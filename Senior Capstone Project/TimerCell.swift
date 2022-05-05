//
//  TimerCell.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 4/26/22.
//

import UIKit

func formatTime(time: Double) -> String{
    
    let hours = time / 3600
    let hrRemain = hours.truncatingRemainder(dividingBy: 1)
    let minutes = hrRemain * 60
    
    let timeFormatter = NumberFormatter()
    timeFormatter.minimumIntegerDigits = 2
    timeFormatter.minimumFractionDigits = 0
    timeFormatter.roundingMode = .down
    
    guard let hrString = timeFormatter.string(from: NSNumber(value: hours)), let minString = timeFormatter.string(from: NSNumber(value: minutes))
    else{
        return "00:00"
    }
    
    let clockTime = "\(hrString):\(minString):00"
    
    return clockTime
    
}

class TimerCell: UICollectionViewCell {
    
    @IBOutlet var cellTitle: UILabel!
    @IBOutlet var cellCircle: UIImageView!
    @IBOutlet var cellDuration: UILabel!
    @IBOutlet var timerButton: UIButton!
    
    func configure(name:String, color:UIColor, duration: Double) -> UIButton{
        
        cellTitle.text = name
        cellCircle.tintColor = color
        cellDuration.text = formatTime(time: duration)
        
        return timerButton
    }
    
}
