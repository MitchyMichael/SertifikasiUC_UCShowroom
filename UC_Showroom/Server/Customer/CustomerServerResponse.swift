//
//  CustomerServerResponse.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import Foundation

struct CustomersResponse: Codable {
    let status: Int
    let message: String
    let data: [NewCustomer]
}

struct NewCustomer: Codable, Identifiable {
    let id, name, address, phoneNumber, idCard: String
}

struct SingleCustomerResponse : Codable {
    let status: Int
    let message: String
    let data: NewCustomer?
}
