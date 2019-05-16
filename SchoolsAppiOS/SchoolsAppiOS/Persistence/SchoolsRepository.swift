//
//  SchoolsRepository.swift
//  SchoolsAppiOS
//
//  Created by Carlos Eduardo Millani on 14/05/19.
//  Copyright © 2019 LearningGitSession. All rights reserved.
//

import Foundation

class SchoolsRepository {
    
    func findAll() -> [School] {
        return [
            School(name: "Escola Arco Iris"),
            School(name: "Escola Cata Vento"),
            School(name: "Escola Batatinha"),
            School(name: "Escola Academigos")
        ]
    }
}
