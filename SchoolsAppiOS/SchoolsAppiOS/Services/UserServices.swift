//
//  UserServices.swift
//  SchoolsAppiOS
//
//  Created by Carlos Eduardo Millani on 14/05/19.
//  Copyright © 2019 LearningGitSession. All rights reserved.
//

import Foundation

class UserServices {
    
    var usersRepository: UsersRepository = UsersRepository()
    
    func login(username: String, password: String) throws -> User {
        return try self.usersRepository.login(username: username, password: password)
    }
}
