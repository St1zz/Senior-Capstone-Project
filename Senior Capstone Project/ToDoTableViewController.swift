//
//  ToDoTableViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 5/10/22.
//

import UIKit

func formatDate(datePicker:UIDatePicker) -> String{
    
    let formatter = DateFormatter()
    formatter.calendar = date.cal
    
}

class newToDo{
    
    var title:String
    var date:String
    
    init(title:String, datePicker:NSDate){
        self.title = title
        self.date = formatDate(datePicker: datePicker)
    }
    
}

var toDoLists:[newToDo] = []
var toDoTableView:UITableView?

class ToDoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let taskCell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as? TaskCell {
            
            let taskIndex = toDoLists[indexPath.row]
            
            taskCell.configure(task: taskIndex.title)
            cell = taskCell
        }
            
        return cell
    }
    

    @IBOutlet var toDoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toDoTable.delegate = self
        toDoTable.dataSource = self
        toDoTableView = toDoTable
        // Do any additional setup after loading the view.
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
