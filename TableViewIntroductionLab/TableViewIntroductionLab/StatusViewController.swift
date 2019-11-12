//
//  StatusViewController.swift
//  TableViewIntroductionLab
//
//  Created by Kelby Mittan on 11/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var tasks = [[Task]]() {
            didSet {
                tableView.reloadData()
            }
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.dataSource = self
            loadData()
    //        dump(Country.getSections())
        }
        
        func loadData() {
            tasks = Task.getSections()
            
        }
        
    }

    extension StatusViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // the data for this table view is an array of arrays [[Country]]
            // no longer can we simply return continents.count
            // this would return 5 in our case, since we have 5 sections (continents) currently
            // we need to return the section's count
            // [section].count on the array of arrays
            return tasks[section].count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
            
            let task = tasks[indexPath.section][indexPath.row]
            
            cell.textLabel?.text = task.name
            
            cell.detailTextLabel?.text = task.dueDate.description
            
            return cell
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return tasks.count
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            
            return tasks[section].first?.status.rawValue
        }
    }
    
