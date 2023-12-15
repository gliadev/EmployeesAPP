//
//  EmployeeProfileView.swift
//  EmployeesAPP
//
//  Created by Adolfo on 15/12/23.
//

import SwiftUI

struct EmployeeProfileView: View {
    let employee: Employee
    var body: some View {
        ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        AsyncImage(url: employee.avatarURL) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .shadow(radius: 10)

                        Text("\(employee.firstName) \(employee.lastName)")
                            .font(.title)
                            .bold()

                        Text(employee.username)
                            .font(.headline)
                            .foregroundColor(.gray)

                        HStack {
                            Image(systemName: "envelope")
                            Text(employee.email)
                        }
                        Spacer()
                    }
                    .padding()
                }
                .navigationTitle("Employee Details")
                .navigationBarTitleDisplayMode(.inline)
            }
        }

#Preview {
    EmployeeProfileView(employee: .testEmployee)
}

