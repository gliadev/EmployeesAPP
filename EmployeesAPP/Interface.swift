//
//  Interface.swift
//  EmployeesAPP
//
//  Created by Adolfo on 15/12/23.
//

import Foundation

let mainURL = URL(string: "https://acacademy-employees-api.herokuapp.com/api")!

extension URL {
    static let empleadosURL = mainURL.appending(path: "getEmpleados")
}
