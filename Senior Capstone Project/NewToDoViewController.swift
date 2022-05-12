//
//  NewToDoViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 5/12/22.
//

import UIKit

class NewToDoViewController: UIViewController {

    @IBOutlet var toDoText: UITextField!
    @IBOutlet var toDoCalendar: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createTap(_ sender: Any) {
        
       let newToDoText = toDoText.text!
      
        let newToDoCell = newToDo(title: newToDoText, datePicker: toDoCalendar)
        
         toDoLists.insert(newToDoCell, at: 0)
         let indexPath = IndexPath(row: 0, section:0)
        toDoTableView!.insertRows(at: [indexPath],with: .fade)
        
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
