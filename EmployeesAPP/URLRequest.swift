//
//  URLRequest.swift
//  EmployeesAPP
//
//  Created by Adolfo on 15/12/23.
//

import Foundation


extension URLRequest {
    static func getCustom(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
