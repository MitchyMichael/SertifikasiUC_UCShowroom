//
//  Vehicles.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import Foundation

struct Vehicle : Encodable {
    let id: String
    let customerId: String
    let type: String
    let model: String
    let year: Int
    let passengers: Int
    let manufacturer: String
    let price: Double
}

struct Car : Encodable {
    let baseInfo: Vehicle
    let fuelType: String
    let trunkSize: Double
}

struct Truck : Encodable {
    let baseInfo: Vehicle
    let numberOfWheels: Int
    let cargoAreaSize: Double
}

struct Motorcycle : Encodable {
    let baseInfo: Vehicle
    let luggageSize: Double
    let fuelCapacity: Double
}


