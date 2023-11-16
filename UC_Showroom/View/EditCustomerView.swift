//
//  EditCustomerView.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import SwiftUI

struct EditCustomerView: View {
    @StateObject private var viewModel = EditCustomerViewModel()
    @Environment(\.dismiss) private var dismiss
    
    @State private var showAlert = false
    
    @State var id: Int
    @State var newName: String
    @State var newAddress: String
    @State var newPhoneNumber: Double
    @State var newIdCard: Double
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack (alignment: .top){
                    
                    // Edit form
                    VStack (alignment: .leading){
                        HStack {
                            Text("Name :")
                            TextField("New Name", text: $newName)
                                .autocorrectionDisabled()
                        }
                        HStack {
                            Text("Address :")
                            TextField("Address", text: $newAddress)
                                .autocorrectionDisabled()
                        }
                        HStack {
                            Text("Phone Number :")
                            TextField("Phone Number", value: $newPhoneNumber, formatter: NumberFormatter())
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                        HStack {
                            Text("ID Number :")
                            TextField("ID Number", value: $newIdCard, formatter: NumberFormatter())
                                .autocorrectionDisabled()
                                .keyboardType(.numberPad)
                        }
                    }
                }
                
                // Save Button
                Button {
                    if newName != "" && newAddress != "" && newPhoneNumber != 0 && newIdCard != 0 {
                        
                        viewModel.updateCustomerData(
                            newCustomerId: id,
                            newCustomerName: newName,
                            newCustomerAddress: newAddress,
                            newCustomerPhoneNumber: newPhoneNumber,
                            newCustomerIdCard: newIdCard)
                        
                        let newView = CustomerListView()
                        UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: newView)
                        
                        dismiss()
                    } else {
                        print("Input not complete")
                        showAlert = true
                    }
                    
                } label: {
                    Text("Save Customer Edit")
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
            .navigationTitle("Edit Customer")
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
    EditCustomerView(id: 0, newName: "", newAddress: "", newPhoneNumber: 0, newIdCard: 0)
}
