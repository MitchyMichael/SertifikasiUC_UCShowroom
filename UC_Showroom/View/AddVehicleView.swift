//
//  AddVehicleView.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import SwiftUI

struct AddVehicleView: View {
    
    @StateObject private var viewModel = AddVehicleViewModel()
    @Environment(\.dismiss) private var dismiss
    
    @State var thisCustomerId: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack (alignment: .top){
                    
                    // Input form
                    VStack (alignment: .leading){
                        HStack {
                            Text("Type :")
                            Picker("Type", selection: $viewModel.selectedType) {
                                Text("Car").tag(Type.Car)
                                Text("Truck").tag(Type.Truck)
                                Text("Motorcycle").tag(Type.Motorcycle)
                            }
                        }
                        HStack {
                            Text("Model :")
                            TextField("Model", text: $viewModel.model)
                                .autocorrectionDisabled()
                        }
                        HStack {
                            Text("Year :")
                            TextField("Year", value: $viewModel.year, formatter: NumberFormatter())
                                .autocorrectionDisabled()
                        }
                        HStack {
                            Text("Passenger Count :")
                            TextField("Passenger Count", value: $viewModel.passengerCount, formatter: NumberFormatter())
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                        HStack {
                            Text("Manufacturer :")
                            TextField("Manufacturer", text: $viewModel.manufacturer)
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                        HStack {
                            Text("Price :")
                            TextField("Price", value: $viewModel.price, formatter: NumberFormatter())
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                        
                        if viewModel.selectedType.rawValue == "Car" {
                            HStack {
                                Text("Fuel Type :")
                                TextField("Fuel Type", text: $viewModel.fuelType)
                                    .autocorrectionDisabled()
                                    .keyboardType(.numberPad)
                            }
                            HStack {
                                Text("Trunk Size :")
                                TextField("Trunk size", value: $viewModel.trunkSize, formatter: NumberFormatter())
                                    .autocorrectionDisabled()
                                    .keyboardType(.numberPad)
                            }
                        } else if viewModel.selectedType.rawValue == "Truck" {
                            HStack {
                                Text("Number of Wheels :")
                                TextField("Number of wheels", value: $viewModel.numberOfWheels, formatter: NumberFormatter())
                                    .autocorrectionDisabled()
                                    .keyboardType(.numberPad)
                            }
                            HStack {
                                Text("Cargo Area Size :")
                                TextField("Cargo area size", value: $viewModel.cargoAreaSize, formatter: NumberFormatter())
                                    .autocorrectionDisabled()
                                    .keyboardType(.numberPad)
                            }
                        } else if viewModel.selectedType.rawValue == "Motorcycle" {
                            HStack {
                                Text("Luggage Size :")
                                TextField("Luggage size", value: $viewModel.luggageSize, formatter: NumberFormatter())
                                    .autocorrectionDisabled()
                                    .keyboardType(.numberPad)
                            }
                            HStack {
                                Text("Fuel Capacity :")
                                TextField("Fuel Capacity", value: $viewModel.cargoAreaSize, formatter: NumberFormatter())
                                    .autocorrectionDisabled()
                                    .keyboardType(.numberPad)
                            }
                        }
                    }
                }
                
                // Save Button
                Button {
                    if viewModel.selectedType.rawValue == "Car" {
                        viewModel.addCar(
                            newCustomerId: thisCustomerId,
                            newType: viewModel.selectedType.rawValue,
                            newModel: viewModel.model,
                            newYear: viewModel.year,
                            newPassengerCount: viewModel.passengerCount,
                            newManufacturer: viewModel.manufacturer,
                            newPrice: viewModel.price,
                            newFuelType: viewModel.fuelType,
                            newTrunkSize: Double(viewModel.trunkSize)
                        )
                    } else if viewModel.selectedType.rawValue == "Truck" {
                        viewModel.addTruck(
                            newCustomerId: thisCustomerId,
                            newType: viewModel.selectedType.rawValue,
                            newModel: viewModel.model,
                            newYear: viewModel.year,
                            newPassengerCount: viewModel.passengerCount,
                            newManufacturer: viewModel.manufacturer,
                            newPrice: viewModel.price,
                            newNumberOfWheels: viewModel.numberOfWheels,
                            newCargoSizeArea: Double(viewModel.cargoAreaSize))
                    } else if viewModel.selectedType.rawValue == "Motorcycle" {
                        viewModel.addMotor(
                            newCustomerId: thisCustomerId,
                            newType: viewModel.selectedType.rawValue,
                            newModel: viewModel.model,
                            newYear: viewModel.year,
                            newPassengerCount: viewModel.passengerCount,
                            newManufacturer: viewModel.manufacturer,
                            newPrice: viewModel.price,
                            newLuggageSize: Double(viewModel.luggageSize),
                            newFuelCapacity: Double(viewModel.fuelCapacity)
                            )
                    }
                    
                    
                    
                    dismiss()
                } label: {
                    Text("Add Vehicle")
                }
                .padding()
                Spacer()
            }
            .padding()
            .navigationTitle("Input Vehicle")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

#Preview {
    AddVehicleView(thisCustomerId: 0)
}
