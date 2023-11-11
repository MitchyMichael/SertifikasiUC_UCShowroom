//
//  AddVehicleViewModel.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import Foundation

enum Type : String, CaseIterable, Identifiable {
    case Car, Motorcycle, Truck
    var id: Self { self }
}

class AddVehicleViewModel : ObservableObject {
    private var serverApi = VehicleServerApi()
    
    @Published var selectedType: Type = .Car
    @Published var customerId: Int = 0
    @Published var model: String = ""
    @Published var year: Int = 0
    @Published var passengerCount: Int = 0
    @Published var manufacturer: String = ""
    @Published var price: Double = 0
    
    func addVehicle(newCustomerId: Int, newType: String, newModel: String, newYear: Int, newPassengerCount: Int, newManufacturer: String, newPrice: Double) {
        
        let push = Vehicle(
            id: "",
            customerId: newCustomerId,
            type: newType,
            model: newModel,
            year: newYear,
            passengers: newPassengerCount,
            manufacturer: newManufacturer,
            price: newPrice
        )
        
        serverApi.createVehicleData(vehicle: push)
    }
}
