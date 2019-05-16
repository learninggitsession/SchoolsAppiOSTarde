//
//  HomeViewController.swift
//  SchoolsAppiOS
//
//  Created by Carlos Eduardo Millani on 14/05/19.
//  Copyright © 2019 LearningGitSession. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    
    private var currentUser: User?
    
    func injectDependencies(user: User) {
        self.currentUser = user
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listSchools" {
            guard let listSchoolsViewController: ListSchoolsViewController = segue
                .destination as? ListSchoolsViewController,
                let user: User = sender as? User else {
                    return
            }
            
            listSchoolsViewController.injectDependencies(user: user)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUI()
    }
    
    private func setupUI() {
        self.helloLabel.text = self.currentUser?.name ?? "Olá!"
    }
    
    @IBAction func didTapListShools(_ sender: Any) {
        self.performSegue(withIdentifier: "listSchools", sender: self.currentUser)
    }
}
