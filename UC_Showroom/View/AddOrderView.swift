//
//  AddCustomerView.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import SwiftUI

struct AddOrderView: View {
    
    @StateObject private var viewModel = AddOrderViewModel()
    @Environment(\.dismiss) private var dismiss
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack (alignment: .top){
                    
                    // Form Input
                    VStack (alignment: .leading){
                        HStack {
                            Text("Name :")
                            TextField("Name", text: $viewModel.name)
                                .autocorrectionDisabled()
                        }
                        HStack {
                            Text("Address :")
                            TextField("Address", text: $viewModel.address)
                                .autocorrectionDisabled()
                        }
                        HStack {
                            Text("Phone Number :")
                            TextField("Phone Number", value: $viewModel.phone, formatter: NumberFormatter())
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                        HStack {
                            Text("ID Number :")
                            TextField("ID Number", value: $viewModel.idNum, formatter: NumberFormatter())
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                    }
                }
                
                // Add Button
                Button {
                    if viewModel.name != "" && viewModel.address != "" && viewModel.phone != 0 && viewModel.idNum != 0 {
                        viewModel.addCustomer(
                            newCustomerName: viewModel.name,
                            newCustomerAddress: viewModel.address,
                            newCustomerPhoneNumber: viewModel.phone,
                            newCustomerIdCard: viewModel.idNum
                        )
                        dismiss()
                    } else {
                        print("Input not complete")
                        showAlert = true
                    }
                    
                } label: {
                    Text("Add Customer")
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Input not complete"),
                        message: Text("Please complete the form")
                    )
                }
                .padding()
                Spacer()
            }
            .padding()
            .navigationTitle("Input Customer")
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
    AddOrderView()
}
