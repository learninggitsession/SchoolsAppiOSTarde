//
//  UsersRepository.swift
//  SchoolsAppiOS
//
//  Created by Carlos Eduardo Millani on 14/05/19.
//  Copyright © 2019 LearningGitSession. All rights reserved.
//

import Foundation

class UsersRepository {
    func login(username: String, password: String) throws -> User {
        if username == "rafinha" {
            return User(name: "Sergio Jefferson Rafael Ordine", username: username)
        } else if username == "cadu" {
            return User(name: "Cadu", username: username)
        } else {
            throw Errors.userNotFound
        }
    }
}
