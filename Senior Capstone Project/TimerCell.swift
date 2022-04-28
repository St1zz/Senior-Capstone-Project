//
//  TimerCell.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 4/26/22.
//

import UIKit

class TimerCell: UICollectionViewCell {
    
    @IBOutlet private var cellTitle: UILabel!
    @IBOutlet private var cellTime: UILabel!
    @IBOutlet private var cellCircle: UIImageView!
    
    func configure(with cellName: String){
        
        cellTitle.text = cellName
        
    }
    
}
