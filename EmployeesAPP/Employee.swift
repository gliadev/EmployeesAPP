//
//  Employee.swift
//  EmployeesAPP
//
//  Created by Adolfo on 15/12/23.
//

import Foundation


struct Employee: Identifiable, Hashable {
    let id: Int
    let email: String
    let username: String
    let firstName: String
    let lastName: String
    let avatar: String?
    let department: DepartmentDTO
}

// para dar formato unido nombre y apellido
let nameFormatter = PersonNameComponentsFormatter()

extension Employee {
    var fullName: String {
        var components = PersonNameComponents()
        components.givenName = firstName
        components.familyName = lastName
        return nameFormatter.string(from: components)
    }
    
    var avatarURL: URL? {
        guard let urlString = avatar else {return nil}
        return URL(string: urlString)
    }
}
