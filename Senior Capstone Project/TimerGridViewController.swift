//
//  TimerGridViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 4/26/22.
//

import UIKit

class TimerGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet var timerCollection: UICollectionView!
    
    let dataSource: [String] = ["Red", "Blue", "Green", "Yellow", "White", "Black", "Orange", "Pink", "Purple", "Magenta", "Grey", "Lime", "Cyan", "Turqoise", "Blue", "Blue", "Blue", "Blue", "Blue", "Blue", "Blue", "Blue", "Blue", "Blue", "Blue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerCollection.delegate = self
        timerCollection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let timerCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? TimerCell {
           
            timerCell.configure(with: dataSource[indexPath.row])
            cell = timerCell
            
        }
        
        return cell
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
