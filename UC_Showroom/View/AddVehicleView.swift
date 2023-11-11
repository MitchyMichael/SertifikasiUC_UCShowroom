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
    
    @State var fuelType = ""
    @State var trunkSize = 0
    @State var numberOfWheels = 0
    @State var cargoAreaSize = 0
    @State var luggageSize = 0
    @State var fuelCapacity = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack (alignment: .top){
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
                                TextField("Fuel Type", text: $fuelType)
                                    .autocorrectionDisabled()
                                    .keyboardType(.numberPad)
                            }
                            HStack {
                                Text("Trunk Size :")
                                TextField("Trunk size", value: $trunkSize, formatter: NumberFormatter())
                                    .autocorrectionDisabled()
                                    .keyboardType(.numberPad)
                            }
                        } else if viewModel.selectedType.rawValue == "Truck" {
                            HStack {
                                Text("Number of Wheels :")
                                TextField("Number of wheels", value: $numberOfWheels, formatter: NumberFormatter())
                                    .autocorrectionDisabled()
                                    .keyboardType(.numberPad)
                            }
                            HStack {
                                Text("Cargo Area Size :")
                                TextField("Cargo area size", value: $cargoAreaSize, formatter: NumberFormatter())
                                    .autocorrectionDisabled()
                                    .keyboardType(.numberPad)
                            }
                        } else if viewModel.selectedType.rawValue == "Motorcycle" {
                            HStack {
                                Text("Luggage Size :")
                                TextField("Luggage size", value: $luggageSize, formatter: NumberFormatter())
                                    .autocorrectionDisabled()
                                    .keyboardType(.numberPad)
                            }
                            HStack {
                                Text("Fuel Capacity :")
                                TextField("Fuel Capacity", value: $cargoAreaSize, formatter: NumberFormatter())
                                    .autocorrectionDisabled()
                                    .keyboardType(.numberPad)
                            }
                        }
                    }
                }
                
                Button {
                    viewModel.addVehicle(
                        newCustomerId: thisCustomerId,
                        newType: viewModel.selectedType.rawValue,
                        newModel: viewModel.model,
                        newYear: viewModel.year,
                        newPassengerCount: viewModel.passengerCount,
                        newManufacturer: viewModel.manufacturer,
                        newPrice: viewModel.price
                    )
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
                ToolbarItem(placement: .navigationBarLeading) {
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
