//
//  LoginViewController.swift
//  SchoolsAppiOS
//
//  Created by Carlos Eduardo Millani on 14/05/19.
//  Copyright © 2019 LearningGitSession. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var userServices: UserServices = UserServices()

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeSegue" {
            guard let homeViewController: HomeViewController = (segue.destination as? HomeViewController),
                let user: User = sender as? User else {
                    return
            }
            
            homeViewController.injectDependencies(user: user)
        }
    }

    @IBAction func didTapLogin(_ sender: Any) {
        self.login()
    }
    
    private func login() {
        guard self.validateFields() else {
            return
        }
        
        let password: String = self.passwordTextField.text ?? ""
        let username: String = self.usernameTextField.text ?? ""
        
        do {
            let user: User = try self.userServices.login(username: username, password: password)
            self.performSegue(withIdentifier: "homeSegue", sender: user)
        } catch {
            print(error)
        }
    }
    
    private func validateFields() -> Bool {
        guard !(self.passwordTextField.text?.isEmpty ?? true), !(self.usernameTextField.text?.isEmpty ?? true) else {
            return false
        }
        
        return true
    }
    
}

