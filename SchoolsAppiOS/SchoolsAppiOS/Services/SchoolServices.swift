//
//  SchoolServices.swift
//  SchoolsAppiOS
//
//  Created by Carlos Eduardo Millani on 14/05/19.
//  Copyright © 2019 LearningGitSession. All rights reserved.
//

import Foundation

class SchoolServices {
    
    var schoolsRepository: SchoolsRepository = SchoolsRepository()
    
    func schools(forUser user: User) throws -> [School] {
        
        if user.username == "cadu" {
            return self.schoolsRepository.findAll()
        } else {
            throw PermissionErrors.noPermission
        }
    }
}
