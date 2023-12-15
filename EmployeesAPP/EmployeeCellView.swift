//
//  EmployeeCellView.swift
//  EmployeesAPP
//
//  Created by Adolfo on 15/12/23.
//

import SwiftUI


struct EmployeeCellView: View {
    let employee: Employee
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(employee.fullName)
                Text(employee.email)
            }
            Spacer()
            AsyncImage(url: employee.avatarURL) {
                image in image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            } placeholder: {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 85)
            }
        }
    }
}

#Preview {
    EmployeeCellView(employee: .testEmployee)
}
