//
//  EditCustomerOrderView.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 12/11/23.
//

import SwiftUI

struct EditCustomerOrderView: View {
    
    @StateObject private var viewModel = EditCustomerOrderViewModel()
    
    @State var newVehicleId: String
    @State var newCustomerId: String
    @State var newType: String
    @State var newModel: String
    @State var newYear: Int
    @State var newPassengerCount: Int
    @State var newManufacturer: String
    @State var newPrice: String
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // Edit form
                VStack (alignment: .leading){
                    HStack {
                        Text("Customer ID :")
                        TextField("CustomerID", text: $newCustomerId)
                            .autocorrectionDisabled()
                    }
                    HStack {
                        Text("Model :")
                        TextField("Model", text: $newModel)
                            .autocorrectionDisabled()
                    }
                    HStack {
                        Text("Year :")
                        TextField("Year", value: $newYear, formatter: NumberFormatter())
                            .autocorrectionDisabled()
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Passenger Count :")
                        TextField("Passenger Count", value: $newPassengerCount, formatter: NumberFormatter())
                            .autocorrectionDisabled()
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Manufacturer :")
                        TextField("Manufacturer", text: $newManufacturer)
                            .autocorrectionDisabled()
                    }
                    HStack {
                        Text("Price :")
                        TextField("Price", text: $newPrice)
                            .autocorrectionDisabled()
                    }
                    
                    if newType == "Car" {
                        HStack {
                            Text("Fuel Type :")
                            TextField("Fuel Type", text: $viewModel.newFuelType)
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                        HStack {
                            Text("Trunk Size :")
                            TextField("Trunk size", value: $viewModel.newTrunkSize, formatter: NumberFormatter())
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                    } else if newType == "Truck" {
                        HStack {
                            Text("Number of Wheels :")
                            TextField("Number of wheels", value: $viewModel.newNumberOfWheels, formatter: NumberFormatter())
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                        HStack {
                            Text("Cargo Area Size :")
                            TextField("Cargo area size", value: $viewModel.newCargoAreaSize, formatter: NumberFormatter())
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                    } else if newType == "Motorcycle" {
                        HStack {
                            Text("Luggage Size :")
                            TextField("Luggage size", value: $viewModel.newLuggageSize, formatter: NumberFormatter())
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                        HStack {
                            Text("Fuel Capacity :")
                            TextField("Fuel Capacity", value: $viewModel.newFuelCapacity, formatter: NumberFormatter())
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                    }
                }
                .padding()
                
                // Save Button
                Button {
                    if newType == "Car" {
                        viewModel.updateCar(newVehicleId: newVehicleId, newCustomerId: newCustomerId, newType: newType, newModel: newModel, newYear: newYear, newPassengerCount: newPassengerCount, newManufacturer: newManufacturer, newPrice: newPrice, thisFuelType: viewModel.newFuelType, thisTrunkSize: viewModel.newTrunkSize)
                        
                    } else if newType == "Truck" {
                        viewModel.updateTruck(newVehicleId: newVehicleId, newCustomerId: newCustomerId, newType: newType, newModel: newModel, newYear: newYear, newPassengerCount: newPassengerCount, newManufacturer: newManufacturer, newPrice: newPrice, thisNumberOfWheels: viewModel.newNumberOfWheels, thisCargoAreaSize: viewModel.newCargoAreaSize)
                        
                    } else if newType == "Motorcycle" {
                        viewModel.updateMotor(newVehicleId: newVehicleId, newCustomerId: newCustomerId, newType: newType, newModel: newModel, newYear: newYear, newPassengerCount: newPassengerCount, newManufacturer: newManufacturer, newPrice: newPrice, thisLuggageSize: viewModel.newLuggageSize, thisFuelCapacity: viewModel.newFuelCapacity)
                    }
                } label: {
                    Text("Save Change")
                }
                
                // Delete button
                Button (role: .destructive){
                    let id: Int = Int(newVehicleId) ?? 0
                    viewModel.deleteVehicle(inputId: id)
                    
                    let newView = OrderListView()
                    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: newView)
                } label: {
                    Text("Delete This Order")
                }
            }
        }
    }
}

#Preview {
    EditCustomerOrderView(
        newVehicleId: "",
        newCustomerId: "",
        newType: "",
        newModel: "",
        newYear: 0,
        newPassengerCount: 0,
        newManufacturer: "",
        newPrice: "")
}
