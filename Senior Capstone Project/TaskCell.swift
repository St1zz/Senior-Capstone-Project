//
//  TaskCell.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 5/11/22.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet var taskLabel: UILabel!
    @IBOutlet var taskDate: UILabel!
    @IBOutlet var checkBox: UIImageView!
    var taskDone = false
    
    func configure(task:String){
        taskLabel.text = task
    }
    
    @IBAction func checkButton(_ sender: Any) {
        print("tapped")
        if taskDone == false{
            taskDone = true
            checkBox.image = UIImage(systemName: "checkmark.square")
        }else{
            taskDone = false
            checkBox.image = UIImage(systemName: "square")
        }
    }
    
    
    
    
}
