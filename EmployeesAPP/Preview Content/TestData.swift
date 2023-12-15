//
//  TestData.swift
//  EmployeesAPP
//
//  Created by Adolfo on 15/12/23.
//

import Foundation


extension Employee {
    static let testEmployee = Employee(id: 1, email: "patatero@patita.tom", username: "patata", firstName: "Patatin", lastName: "Potato", avatar: "https://robohash.org/patata", department: DepartmentDTO.init(name: .businessDevelopment, id: 2))
}

struct testEmployee: EmployeeInteractorProtocol {
    let urlTest = Bundle.main.url(forResource: "TestEmployee", withExtension: "json")!
    
    func getEmpleados() async throws -> [Employee] {
        let data = try Data(contentsOf: urlTest)
        return try JSONDecoder().decode([EmployeeDTO].self, from: data).map(\.toPresentation)
    }
}

extension EmployeeViewModel {
    static let localTest = EmployeeViewModel(employeeInteractor: testEmployee())
}
