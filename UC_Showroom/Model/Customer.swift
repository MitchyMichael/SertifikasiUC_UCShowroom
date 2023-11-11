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

//// Model untuk data customer
//class Customer : Identifiable {
//    let id = UUID()
//    var name: String
//    var address: String
//    var phoneNumber: String
//    var idCard: String
//    var vehicles: [Vehicle]
//
//    init(name: String, address: String, phoneNumber: String, idCard: String, vehicles: [Vehicle]) {
//        self.name = name
//        self.address = address
//        self.phoneNumber = phoneNumber
//        self.idCard = idCard
//        self.vehicles = vehicles
//    }
//
//    // Metode untuk menambah kendaraan ke dalam pesanan customer
//    func addVehicle(_ vehicle: Vehicle) {
//        vehicles.append(vehicle)
//    }
//
//    // Metode untuk menghitung total biaya pesanan customer
//    func calculateTotalCost() -> Double {
//        var totalCost = 0.0
//        for vehicle in vehicles {
//            totalCost += vehicle.price
//        }
//        return totalCost
//    }
//}
//
//// Contoh penggunaan model
//let customer1 = Customer(name: "John Doe", address: "123 Main St", phoneNumber: "555-1234", idCard: "ID123", vehicles: [])
//
//let car1 = Car(model: "Sedan", year: 2023, passengers: 5, manufacturer: "Toyota", price: 30000.0, fuelType: "Bensin", trunkSize: 15.0)
//let truck1 = Truck(model: "Pickup", year: 2023, passengers: 2, manufacturer: "Ford", price: 40000.0, numberOfWheels: 4, cargoAreaSize: 50.0)
//
////customer1.addVehicle(car1)
////customer1.addVehicle(truck1)
////
////let totalCost = customer1.calculateTotalCost()
////
////print("Customer Name: \(customer1.name)")
////print("Total Cost: \(totalCost)")
//
//// Metode untuk mengubah data customer
//func updateCustomerData(customer: Customer, name: String, address: String, phoneNumber: String, idCard: String) {
//    customer.name = name
//    customer.address = address
//    customer.phoneNumber = phoneNumber
//    customer.idCard = idCard
//}
//
//// Metode untuk menghapus data customer
//func deleteCustomer(customer: inout Customer) {
//    customer = Customer(name: "", address: "", phoneNumber: "", idCard: "", vehicles: [])
//}
//
//// Contoh penggunaan metode
////updateCustomerData(customer: customer1, name: "Jane Doe", address: "456 Oak St", phoneNumber: "555-5678", idCard: "ID456")
////
////deleteCustomer(customer: &customer1)
//
//var dummyCustomer: [Customer] = [
//    Customer(name: "Michael", address: "Disini", phoneNumber: "0896666", idCard: "08967676", vehicles: [])
//]
