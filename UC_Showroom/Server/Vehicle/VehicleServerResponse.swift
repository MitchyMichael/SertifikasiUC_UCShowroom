//
//  VehicleServerResponse.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import Foundation

struct VehicleResponse: Codable {
    let status: Int
    let message: String
    let data: [NewVehicle]
}

struct NewVehicle: Codable, Identifiable {
    let id, customerId, type, model, year, passengerCount, manufacturer, price: String
}

struct SingleVehicleResponse : Codable {
    let status: Int
    let message: String
    let data: NewVehicle?
}
