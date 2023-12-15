//
//  EmployeeViewModel.swift
//  EmployeesAPP
//
//  Created by Adolfo on 15/12/23.
//

import Foundation


final class EmployeeViewModel: ObservableObject {
    
    let employeeInteractor: EmployeeInteractorProtocol
    @Published var employess: [Employee] = []
    
    @Published var searchText: String = ""
    
    var nonEmptyDepartment: [DepartmentName] {
        Array(Set(employess.map(\.department.name))).sorted(by: { $0.rawValue > $1.rawValue} )
    }
    
    init(employeeInteractor: EmployeeInteractorProtocol = EmployeeInteractor()) {
        self.employeeInteractor = employeeInteractor
        Task {
            await getEmployess()
        }
    }
    
    
    func getEmployess() async {
        do {
            let employee =  try await employeeInteractor.getEmpleados()
            await MainActor.run {
                employess = employee
            }
        } catch let error as NetworkErrors {
            print(error.description)
            
        } catch {
            print(error)
            
        }
    }
    
    func getEmpleadosPorDepartamento(department: DepartmentName) -> [Employee] {
        employess.filter { employess in
            employess.department.name == department
        }
        //filtrar listado de empleados
        .filter { employees in
            employees.fullName.range(of: searchText, options: [.caseInsensitive, .diacriticInsensitive]) != nil
        }
    }
}
