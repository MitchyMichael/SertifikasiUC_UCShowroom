//
//  CustomerDetail.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import SwiftUI

struct CustomerDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var api = CustomerServerApi()
    @StateObject private var viewModel = CustomerDetailViewModel()
    
    @State var isEdit = false
    @State var totalPrice = 0
    @State var customerId: String
    
    var customerName, customerAddress, customerPhone, customerIdCard: String
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    
                    // Customer Detail
                    VStack (alignment: .leading) {
                        Text("Id: \(customerId)")
                        Text("Name: \(customerName)")
                        Text("Address: \(customerAddress)")
                        Text("Phone: \(customerPhone)")
                        Text("ID Card: \(customerIdCard)")
                            .padding(.bottom)
                        
                        ForEach(api.totalPrice) { total in
                            Text("Total Price: \(total.total_price)")
                        }
                    }
                    Spacer()
                }
                .padding()
                
                // To add vehicle
                NavigationLink(destination: AddVehicleView(thisCustomerId: Int(customerId) ?? 0)) {
                    Text("Add Order")
                }
                
                // To see customer's order
                NavigationLink(destination: SeeCustomerOrderView(newCustomerId: Int(customerId) ?? 0)) {
                    Text("See Customer Order")
                }
                
                // To delete customer
                Button (role: .destructive){
                    viewModel.deleteData(customerId: Int(customerId)!)
                    let newView = CustomerListView()
                    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: newView)
                } label: {
                    Text("Delete Customer")
                }
                .padding()
                Spacer()
            }
            .navigationTitle("\(customerName)")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isEdit = true
                    } label: {
                        Text("Edit Customer")
                    }
                }
            }
        }
        .onAppear() {
            
            // Get total price from API
            api.getTotalPriceByCustomerId(customerId: Int(customerId) ?? 0)
        }
        .sheet(isPresented: $isEdit, content: {
            EditCustomerView(id: Int(customerId)!, newName: customerName, newAddress: customerAddress, newPhoneNumber: Double(customerPhone) ?? 0, newIdCard: Double(customerIdCard) ?? 0)
                .interactiveDismissDisabled()
        })
        
    }
}

#Preview {
    CustomerDetailView(customerId: "", customerName: "", customerAddress: "", customerPhone: "", customerIdCard: "")
}
