//
//  FocusModeViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 5/19/22.
//

import UIKit

class FocusModeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func focusTap(_ sender: Any) {
        UIView.animate(withDuration: 3.0){
            self.view.backgroundColor = #colorLiteral(red: 0.4068264961, green: 0.1091894284, blue: 1, alpha: 1)
        }
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
