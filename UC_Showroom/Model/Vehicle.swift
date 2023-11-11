//
//  Vehicles.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import Foundation

struct Vehicle : Encodable {
    let id: String
    let customerId: Int
    let type: String
    let model: String
    let year: Int
    let passengers: Int
    let manufacturer: String
    let price: Double
}

struct Car {
    let baseInfo: Vehicle
    let fuelType: String
    let trunkSize: Double
}

struct Truck {
    let baseInfo: Vehicle
    let numberOfWheels: Int
    let cargoAreaSize: Double
}

struct Motorcycle {
    let baseInfo: Vehicle
    let luggageSize: Double
    let fuelCapacity: Double
}


// Example usage:

//let carExample = Car(baseInfo: Vehicle(type: .car, model: "Sedan", year: 2023, passengers: 5, manufacturer: "Toyota", price: 25000.0),
//                     fuelType: "Gasoline",
//                     trunkSize: 15.0)
//
//let truckExample = Truck(baseInfo: Vehicle(type: .truck, model: "Pickup", year: 2023, passengers: 2, manufacturer: "Ford", price: 35000.0),
//                         numberOfWheels: 4,
//                         cargoAreaSize: 50.0)
//
//let motorcycleExample = Motorcycle(baseInfo: Vehicle(type: .motorcycle, model: "Sport Bike", year: 2023, passengers: 1, manufacturer: "Harley-Davidson", price: 15000.0),
//                                   luggageSize: 5.0,
//                                   fuelCapacity: 10.0)

