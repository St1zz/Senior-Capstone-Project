//
//  TimerCell.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 4/26/22.
//

import UIKit

class TimerCell: UICollectionViewCell {
    
    @IBOutlet var cellTitle: UILabel!
    @IBOutlet var cellCircle: UIImageView!
    @IBOutlet var cellDuration: UILabel!
    @IBOutlet var timerButton: UIButton!
    
    func configure(name:String, color:UIColor, duration: Double) -> UIButton{
        
        cellTitle.text = name
        cellCircle.tintColor = color
        let newDuration = HrsMinsSecs(seconds: Int(duration))
        cellDuration.text = formatTimeSeconds(hours: newDuration.0, minutes: newDuration.1, seconds: newDuration.2)
        
        return timerButton
    }
    
}
