//
//  Customer.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import Foundation

struct Customer : Identifiable, Encodable {
    let id: String
    var name: String
    var address: String
    var phoneNumber: String
    var idCard: String
}
