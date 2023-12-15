//
//  EmployeeDTO.swift
//  EmployeesAPP
//
//  Created by Adolfo on 15/12/23.
//

import Foundation


struct EmployeeDTO: Codable {
    let id: Int
    let email: String
    let username: String
    let firstName: String
    let lastName: String
    let avatar: String
    let department: DepartmentDTO
    
}

struct DepartmentDTO: Codable, Hashable {
    let name: DepartmentName
    let id: Int
}

enum DepartmentName: String, Codable, CaseIterable, Identifiable{
    var id: Self { self }
    
    case accounting = "Accounting"
    case businessDevelopment = "Business Development"
    case engineering = "Engineering"
    case humanResources = "Human Resources"
    case legal = "Legal"
    case marketing = "Marketing"
    case productManagement = "Product Management"
    case researchAndDevelopment = "Research and Development"
    case sales = "Sales"
    case services = "Services"
    case support = "Support"
    case training = "Training"
}


extension EmployeeDTO {
    var toPresentation: Employee {
        Employee(id: id, email: email, username: username, firstName: firstName, lastName: lastName, avatar: avatar, department: department)
    }
}
