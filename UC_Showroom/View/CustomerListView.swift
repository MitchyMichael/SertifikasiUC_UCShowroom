//
//  CustomerListView.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import SwiftUI

struct CustomerListView: View {
    
    @StateObject private var viewModel = CustomerListViewModel()
    @StateObject private var api = CustomerServerApi()
    @State private var isNewOrder = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading){
                    
                    // Customer List View
                    ForEach(api.customers) { customer in
                        
                        // If clicked ...
                        NavigationLink(destination: CustomerDetailView(
                            customerId: customer.id,
                            customerName: customer.name,
                            customerAddress: customer.address,
                            customerPhone: customer.phoneNumber,
                            customerIdCard: customer.idCard
                            )) {
                                
                            HStack {
                                VStack (alignment: .leading) {
                                    let newPhoneNumber = viewModel.forTrailingZero(Double(customer.phoneNumber) ?? 0)
                                    
                                    Text("Id: \(customer.id)")
                                    Text("Name: \(customer.name)")
                                    Text("Address: \(customer.address)")
                                    Text("Phone: \(newPhoneNumber)")
                                    Text("ID Card: \(customer.idCard)")
                                        .padding(.bottom)
                                    Divider()
                                }
                                .padding(.top)
                                Spacer()
                                Image(systemName: "arrow.right.to.line")
                                    .foregroundStyle(.blue)
                            }
                            .foregroundStyle(.black)
                            }
                            .padding(.horizontal)
                    }
                }
                .onAppear(){
                    // Get all customer data from API
                    api.getAllCustomerData()
                }
                
            }
            .navigationTitle("Customer List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isNewOrder = true
                    } label: {
                        Text("New Order")
                    }
                }
            }
            
        }
        .preferredColorScheme(.light)
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
    CustomerListView()
}
