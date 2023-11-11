//
//  SeeCustomerOrderViwe.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import SwiftUI

struct SeeCustomerOrderView: View {
    @StateObject private var api = VehicleServerApi()
    @State var newCustomerId: Int
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    // Customer Orders List
                    ForEach(api.vehicles) { vehicle in
                        HStack {
                            NavigationLink(destination: EditCustomerOrderView(
                                newVehicleId: vehicle.id,
                                newCustomerId: vehicle.customerId,
                                newType: vehicle.type,
                                newModel: vehicle.model,
                                newYear: Int(vehicle.year) ?? 0,
                                newPassengerCount: Int(vehicle.passengerCount) ?? 0,
                                newManufacturer: vehicle.manufacturer,
                                newPrice: vehicle.price)) {
                                
                                VStack (alignment: .leading){
                                    Text("ID: \(vehicle.id)")
                                    Text("Customer ID: \(vehicle.customerId)")
                                    Text("Vehicle Type: \(vehicle.type)")
                                    Text("Model: \(vehicle.model)")
                                    Text("Year: \(vehicle.year)")
                                    Text("Passenger Count: \(vehicle.passengerCount)")
                                    Text("Manufacturer: \(vehicle.manufacturer)")
                                    Text("Price: \(vehicle.price)")
                                }
                                .foregroundStyle(.black)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                }
                .navigationTitle("Customer Order")
            }
        }
        .onAppear() {
            
            // Get Customer Order Data
            api.getDataByCustomerId(customerId: newCustomerId)
        }
        
    }
}

#Preview {
    SeeCustomerOrderView(newCustomerId: 0)
}
