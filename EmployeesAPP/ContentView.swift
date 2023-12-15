//
//  ContentView.swift
//  EmployeesAPP
//
//  Created by Adolfo on 15/12/23.
//

import SwiftUI

struct ContentView: View {
 @ObservedObject var employeesVM = EmployeeViewModel()
 
 var body: some View {
     NavigationStack {
         List{
             ForEach(employeesVM.nonEmptyDepartment){
                 department in Section(department.rawValue){
                     ForEach(employeesVM.getEmpleadosPorDepartamento(department: department)) {
                         employee in NavigationLink(value: employee) {
                             EmployeeCellView(employee: employee)
                         }
                     }
                 }
             }
         }
         .searchable(text: $employeesVM.searchText, placement: .toolbar, prompt: "Busqueda")
         .navigationTitle("Employye")
         .navigationDestination(for: Employee.self) {
             employee in
            EmployeeProfileView(employee: employee)
         }
         
     }
 }
}


#Preview {
 ContentView(employeesVM: .localTest)
}
