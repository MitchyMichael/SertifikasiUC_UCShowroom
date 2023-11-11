//
//  SeeAllVehicleView.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import SwiftUI

struct SeeAllVehicleView: View {
    @StateObject private var api = VehicleServerApi()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading){
                    ForEach(api.vehicles) { vehicle in
                        NavigationLink(destination: VehicleDetailView()) {
                            HStack {
                                VStack (alignment: .leading) {
                                    Text("Customer ID: \(vehicle.customerId)")
                                    Text("Type: \(vehicle.type)")
                                    Text("Model: \(vehicle.model)")
                                    Text("Year: \(vehicle.year)")
                                    Text("Passenger: \(vehicle.passengerCount)")
                                    Text("Manufacturer: \(vehicle.manufacturer)")
                                    Text("Price: \(vehicle.price)")
                                        .padding(.bottom)
                                    Divider()
                                }
                                .foregroundStyle(.black)
                                .padding(.top)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        
                    }
                }
                .onAppear(){
                    Text("testing")
                    api.getAllVehiclesData()
                }
                
            }
            .navigationTitle("Ordered Vehicle")
        }
    }
}

#Preview {
    SeeAllVehicleView()
}
