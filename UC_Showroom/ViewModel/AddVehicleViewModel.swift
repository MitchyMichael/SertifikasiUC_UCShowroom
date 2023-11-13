//
//  AddVehicleViewModel.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import Foundation

class AddVehicleViewModel : ObservableObject {
    private var serverApi = VehicleServerApi()
    
    @Published var fuelType = ""
    @Published var trunkSize = 0
    @Published var numberOfWheels = 0
    @Published var cargoAreaSize = 0
    @Published var luggageSize = 0
    @Published var fuelCapacity = 0
    
    @Published var thisVehicleId = ""
    
    @Published var selectedType: Type = .Car
    @Published var customerId: Int = 0
    @Published var model: String = ""
    @Published var year: Int = 0
    @Published var passengerCount: Int = 0
    @Published var manufacturer: String = ""
    @Published var price: Double = 0
    
    // To add motorcycle
    func addMotor(newCustomerId: Int, newType: String, newModel: String, newYear: Int, newPassengerCount: Int, newManufacturer: String, newPrice: Double, newLuggageSize: Double, newFuelCapacity: Double) {
        
        let newVehicle = Motorcycle(
            baseInfo: Vehicle(
                id: "",
                customerId: String(newCustomerId),
                type: newType,
                model: newModel,
                year: newYear,
                passengers: newPassengerCount,
                manufacturer: newManufacturer,
                price: newPrice),
            luggageSize: newLuggageSize,
            fuelCapacity: newFuelCapacity
        )
        
        serverApi.createMotorData(vehicle: newVehicle)
    }
    
    // To add car
    func addCar(newCustomerId: Int, newType: String, newModel: String, newYear: Int, newPassengerCount: Int, newManufacturer: String, newPrice: Double, newFuelType: String, newTrunkSize: Double) {
        
        let newVehicle = Car(
            baseInfo: Vehicle(
                id: "",
                customerId: String(newCustomerId),
                type: newType,
                model: newModel,
                year: newYear,
                passengers: newPassengerCount,
                manufacturer: newManufacturer,
                price: newPrice),
            fuelType: newFuelType,
            trunkSize: newTrunkSize
        )
        
        serverApi.createCarData(vehicle: newVehicle)
    }
    
    // To add truck
    func addTruck(newCustomerId: Int, newType: String, newModel: String, newYear: Int, newPassengerCount: Int, newManufacturer: String, newPrice: Double, newNumberOfWheels: Int, newCargoSizeArea: Double) {
        
        let newVehicle = Truck(
            baseInfo: Vehicle(
                id: "",
                customerId: String(newCustomerId),
                type: newType,
                model: newModel,
                year: newYear,
                passengers: newPassengerCount,
                manufacturer: newManufacturer,
                price: newPrice),
            wheelCount: newNumberOfWheels,
            cargoAreaSize: newCargoSizeArea
        )
        
        serverApi.createTruckData(vehicle: newVehicle)
    }
}
