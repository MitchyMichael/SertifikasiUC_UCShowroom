//
//  CustomerListView.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import SwiftUI

struct OrderListView: View {
    
    @StateObject private var api = CustomerServerApi()
    @State private var isNewOrder = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading){
                    ForEach(api.customers) { customer in
                        NavigationLink(destination: CustomerDetailView(
                            customerId: customer.id,
                            customerName: customer.name,
                            customerAddress: customer.address,
                            customerPhone: customer.phoneNumber,
                            customerIdCard: customer.idCard
                            )) {
                                
                            HStack {
                                VStack (alignment: .leading) {
                                    Text("Id: \(customer.id)")
                                    Text("Name: \(customer.name)")
                                    Text("Address: \(customer.address)")
                                    Text("Phone: \(customer.phoneNumber)")
                                    Text("ID Card: \(customer.idCard)")
                                        .padding(.bottom)
                                    Divider()
                                }
                                .padding(.top)
                                Spacer()
                            }
                            .foregroundStyle(.black)
                            }
                            .padding(.horizontal)
                    }
                }
                .onAppear(){
                    Text("testing")
                    api.getAllCustomerData()
                }
                
            }
            .navigationTitle("Order List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isNewOrder = true
                    } label: {
                        Text("New Order")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SeeAllVehicleView()) {
                        Text("Ordered Vehicle")
                    }
                }
            }
            
        }
        .sheet(isPresented: $isNewOrder, content: {
            AddOrderView()
                .onDisappear(){
                    api.getAllCustomerData()
                }
                .interactiveDismissDisabled()
        })
        
    }
}

#Preview {
    OrderListView()
}
