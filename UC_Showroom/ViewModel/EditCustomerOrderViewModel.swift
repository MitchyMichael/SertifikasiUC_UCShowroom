//
//  EditCustomerOrderView.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 12/11/23.
//

import Foundation

class EditCustomerOrderViewModel : ObservableObject {
    
    @Published var api = VehicleServerApi()
    
    @Published var newFuelType: String = ""
    @Published var newTrunkSize: Int = 0
    @Published var newNumberOfWheels: Int = 0
    @Published var newCargoAreaSize: Int = 0
    @Published var newLuggageSize: Int = 0
    @Published var newFuelCapacity: Int = 0
    
    // Function to call API to delete vehicle
    func deleteVehicle(inputId: Int) {
        let id = inputId
        api.deleteVehicle(inputId: id)
    }
    
    // Function to call API to update car
    func updateCar(newVehicleId: String, newCustomerId: String, newType: String, newModel: String, newYear: Int, newPassengerCount: Int, newManufacturer: String, newPrice: String, thisFuelType: String, thisTrunkSize: Int) {
            let newCar = ThisCar(
                id: newVehicleId,
                customerId: newCustomerId,
                type: newType,
                model: newModel,
                year: newYear,
                passengerCount: newPassengerCount,
                manufacturer: newManufacturer,
                price: Double(newPrice) ?? 0,
                fuelType: thisFuelType,
                trunkSize: Double(thisTrunkSize))
            
            api.updateCar(vehicle: newCar)
    }
    
    // Function to call API to update truck
    func updateTruck(newVehicleId: String, newCustomerId: String, newType: String, newModel: String, newYear: Int, newPassengerCount: Int, newManufacturer: String, newPrice: String, thisNumberOfWheels: Int, thisCargoAreaSize: Int) {
        let newTruck = ThisTruck(
            id: newVehicleId, customerId: newCustomerId, type: newType, model: newModel, year: newYear, passengerCount: newPassengerCount, manufacturer: newManufacturer, price: Double(newPrice) ?? 0, wheelCount: thisNumberOfWheels, cargoAreaSize: Double(thisCargoAreaSize))
        
        api.updateTruck(vehicle: newTruck)
    }
    
    // Function to call API to update motor
    func updateMotor(newVehicleId: String, newCustomerId: String, newType: String, newModel: String, newYear: Int, newPassengerCount: Int, newManufacturer: String, newPrice: String, thisLuggageSize: Int, thisFuelCapacity: Int) {
        let newMotor = ThisMotorcycle(
            id: newVehicleId, customerId: newCustomerId, type: newType, model: newModel, year: newYear, passengerCount: newPassengerCount, manufacturer: newManufacturer, price: Double(newPrice) ?? 0, luggageSize: Double(thisLuggageSize), fuelCapacity: Double(thisFuelCapacity))
        
        api.updateMotor(vehicle: newMotor)
    }
    
}
