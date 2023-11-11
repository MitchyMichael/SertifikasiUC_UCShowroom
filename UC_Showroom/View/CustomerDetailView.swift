//
//  CustomerDetail.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import SwiftUI

struct CustomerDetailView: View {
    @StateObject private var viewModel = CustomerDetailViewModel()
    @State var isEdit = false
    
    @Environment(\.dismiss) private var dismiss
    
    var customerId, customerName, customerAddress, customerPhone, customerIdCard: String
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    VStack (alignment: .leading) {
                        Text("Id: \(customerId)")
                        Text("Name: \(customerName)")
                        Text("Address: \(customerAddress)")
                        Text("Phone: \(customerPhone)")
                        Text("ID Card: \(customerIdCard)")
                        Text("")
                        Text("Vehicles:")
                            .padding(.bottom)
                    }
                    Spacer()
                }
                .padding()
                
                NavigationLink(destination: AddVehicleView(thisCustomerId: Int(customerId)!)) {
                    Text("Add Vehicle")
                }
                
                Button (role: .destructive){
                    viewModel.deleteData(customerId: Int(customerId)!)
                    let newView = OrderListView()
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
        .sheet(isPresented: $isEdit, content: {
            EditCustomerView(id: Int(customerId)!, newName: customerName, newAddress: customerAddress, newPhoneNumber: Double(customerPhone) ?? 0, newIdCard: Double(customerIdCard) ?? 0)
                .interactiveDismissDisabled()
        })
        
    }
}

#Preview {
    CustomerDetailView(customerId: "", customerName: "", customerAddress: "", customerPhone: "", customerIdCard: "")
}
