//
//  EditCustomerViewModel.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import Foundation

class EditCustomerViewModel : ObservableObject {
    
    @Published private var serverApi = CustomerServerApi()
    
    // To update customer
    func updateCustomerData(newCustomerId: Int, newCustomerName: String, newCustomerAddress: String, newCustomerPhoneNumber: Double, newCustomerIdCard: Double) {
        
        let push = Customer(
            id: String(newCustomerId),
            name: newCustomerName,
            address: newCustomerAddress,
            phoneNumber: String(newCustomerPhoneNumber),
            idCard: String(newCustomerIdCard)
        )
        
        serverApi.updateData(customer: push)
    }
    
}
