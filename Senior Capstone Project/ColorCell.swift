//
//  ColorCell.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 5/2/22.
//

import UIKit

var selectedColor:UIColor = .red
var oldCheckMark:UIImageView?

class ColorCell: UICollectionViewCell {
    
    @IBOutlet var background: UIView!
    @IBOutlet var selectButton: UIButton!
    @IBOutlet var checkMark: UIImageView!
    
    var color:UIColor = .red
    
    func setColor(with cellColor: UIColor){
        color = cellColor
        background.backgroundColor = cellColor
        background.layer.cornerRadius = 5
        if cellColor == .red{
            checkMark.isHidden = false
            oldCheckMark = checkMark
        }
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        oldCheckMark!.isHidden = true
        checkMark.isHidden = false
        selectedColor = color
        oldCheckMark = checkMark
    }
    
}
