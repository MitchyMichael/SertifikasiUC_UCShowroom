//
//  AddCustomerViewModel.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import Foundation

class AddOrderViewModel : ObservableObject {
    
    private var serverApi = CustomerServerApi()
    
    @Published var name: String = ""
    @Published var address: String = ""
    @Published var phone: Double = 0
    @Published var idNum: Double = 0
    
    // To add customer
    func addCustomer(newCustomerName: String, newCustomerAddress: String, newCustomerPhoneNumber: Double, newCustomerIdCard: Double) {
        
        let push = Customer(
            id: "", 
            name: newCustomerName,
            address: newCustomerAddress,
            phoneNumber: String(newCustomerPhoneNumber),
            idCard: String(newCustomerIdCard)
        )
        serverApi.createCustomerData(customer: push)
    }
}
