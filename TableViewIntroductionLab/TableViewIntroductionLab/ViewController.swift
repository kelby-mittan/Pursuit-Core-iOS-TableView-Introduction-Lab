//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private var tasks = [Task]() {
            didSet {
                tableView.reloadData()
            }
        }
        
    private var sortAscending = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        sortData(sortAscending)
    }
    @IBAction func sortButtonPressed(_ sender: UIBarButtonItem) {
        sortAscending.toggle()
        sortData(sortAscending)
    }
    
    func sortData(_ sortAscending: Bool) {
        if sortAscending {
            tasks = Task.allTasks.sorted { $0.name < $1.name}
            navigationItem.rightBarButtonItem?.title = "Sort Descending"
        } else {
            tasks = Task.allTasks.sorted { $0.name > $1.name}
            navigationItem.rightBarButtonItem?.title = "Sort Ascending"
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        let task = tasks[indexPath.row]
        
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.dueDate.description

        return cell
    }

}

