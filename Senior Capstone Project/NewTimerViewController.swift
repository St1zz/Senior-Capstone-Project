//
//  NewTimerViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 5/2/22.
//

import UIKit

var newTimerName:String = "Timer Name"
var newTimerDuration:Double = 60
var newTimerColor:UIColor = .red

class NewTimerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let colors:[UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .black, .white]

    @IBOutlet var colorPickerCollection: UICollectionView!
    @IBOutlet var timerDuration: UIDatePicker!
    @IBOutlet var timerName: UITextField!
    @IBOutlet var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorPickerCollection.delegate = self
        colorPickerCollection.dataSource = self
        
        createButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let colorCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCell{
            
            colorCell.setColor(with: colors[indexPath.row])
            cell = colorCell
            
        }
        
        return cell
    }
    
    
    
    @IBAction func createNewTimer(_ sender: Any) {
        
        newTimerName = timerName.text!
        newTimerDuration = timerDuration.countDownDuration
        newTimerColor = selectedColor
        
        let newTimer = "Rainbow"
         elements.insert(newTimer, at: 0)
         let indexPath = IndexPath(row: 0, section:0)
         timerGrid!.insertItems(at: [indexPath])
        
    }
    
}
