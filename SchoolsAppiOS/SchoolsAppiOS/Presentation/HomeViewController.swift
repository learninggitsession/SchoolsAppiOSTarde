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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUI()
    }
    
    private func setupUI() {
        self.helloLabel.text = self.currentUser?.name ?? "Olá!"
    }
}
