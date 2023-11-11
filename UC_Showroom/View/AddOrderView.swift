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
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack (alignment: .top){
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
                
                Button {
                    viewModel.addCustomer(
                        newCustomerName: viewModel.name,
                        newCustomerAddress: viewModel.address,
                        newCustomerPhoneNumber: viewModel.phone,
                        newCustomerIdCard: viewModel.idNum
                    )
                    dismiss()
                } label: {
                    Text("Add Customer")
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
