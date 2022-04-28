//
//  TimerCell.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 4/26/22.
//

import UIKit

class TimerCell: UICollectionViewCell {
    
    @IBOutlet var cellTitle: UILabel!
    
    func configure(with cellName: String){
        
        cellTitle.text = cellName
        
    }
    
}
