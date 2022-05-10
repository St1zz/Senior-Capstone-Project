//
//  ToDoTableViewController.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 5/10/22.
//

import UIKit

class newToDo{
    
    var title:String
    var date:String
    var description: String
    
    init(title:String, date:String, description:String){
        self.title = title
        self.date = date
        self.description = description
    }
    
}

var toDoLists:[newToDo] = [newToDo(title: "Dont forget to sing and dance", date: <#T##String#>, description: <#T##String#>) ]

class ToDoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    @IBOutlet var toDoTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        toDoTable.delegate = self
        toDoTable.dataSource = self
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
