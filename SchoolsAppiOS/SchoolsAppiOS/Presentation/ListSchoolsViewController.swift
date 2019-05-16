//
//  ListSchoolsViewController.swift
//  SchoolsAppiOS
//
//  Created by Carlos Eduardo Millani on 14/05/19.
//  Copyright © 2019 LearningGitSession. All rights reserved.
//

import UIKit

class ListSchoolsViewController: UITableViewController {
    
    var schoolServices: SchoolServices = SchoolServices()
    
    var user: User?
    var schools: [School] = []
    
    func injectDependencies(user: User) {
        self.user = user
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUIData()
    }
    
    func setupUIData() {
        self.schools = []
        if let user = self.user {
            do {
                self.schools = try self.schoolServices.schools(forUser: user)
            } catch {
                print(error)
            }
        }
        
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schools.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "simpleCell") ?? UITableViewCell()
        
        cell.textLabel?.text = self.schools[indexPath.row].name
        
        return cell
    }
}
