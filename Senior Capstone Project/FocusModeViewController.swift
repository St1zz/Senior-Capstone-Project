//
//  FocusModeViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 5/19/22.
//

import UIKit

class FocusModeViewController: UIViewController {

    @IBOutlet var focusImage: UIImageView!
    @IBOutlet var circleImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func focusTap(_ sender: Any) {
        UIView.animate(withDuration: 0.75){
            self.view.backgroundColor = #colorLiteral(red: 0.2674478292, green: 0.07376533002, blue: 0.674910605, alpha: 1)
            self.circleImage.tintColor = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
            self.focusImage.tintColor = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
        }
        focusImage.image = UIImage(systemName: "moon.fill")
        
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
