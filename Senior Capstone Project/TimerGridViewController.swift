//
//  TimerGridViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 4/26/22.
//

import UIKit

class newTimer{
    
    var name:String
    var color:UIColor
    var duration:Double
    
    init(name:String, color:UIColor, duration:Double){
        self.name = name
        self.color = color
        self.duration = duration
    }
    
}

var timers: [newTimer] = [newTimer(name: "My Timer", color: .red, duration: 600)]

var timerGrid:UICollectionView?

class TimerGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet var timerCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerCollection.delegate = self
        timerCollection.dataSource = self
        timerGrid = timerCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let timerCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? TimerCell {
           
            let timerIndex = timers[indexPath.row]
            
            timerCell.configure( name: timerIndex.name, color: timerIndex.color, duration: timerIndex.duration)
            cell = timerCell
            
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
    
}
/*
 
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
*/
