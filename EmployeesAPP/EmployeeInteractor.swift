//
//  EmployeeInteractor.swift
//  EmployeesAPP
//
//  Created by Adolfo on 15/12/23.
//

import Foundation


protocol EmployeeInteractorProtocol {
    func getEmpleados() async throws -> [Employee]
}

struct EmployeeInteractor: EmployeeInteractorProtocol {
    func getEmpleados() async throws -> [Employee] {
        try await getJSON(request: .getCustom(url: .empleadosURL), type: [EmployeeDTO].self).map(\.toPresentation)
    }
}
