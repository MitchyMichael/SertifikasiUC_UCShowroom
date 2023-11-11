//
//  CustomerDetailViewModel.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import Foundation

class CustomerDetailViewModel : ObservableObject {
    
    @Published private var serverApi = CustomerServerApi()
    
    func deleteData(customerId: Int) {
        var thisInputId = customerId
        print("This ID is deleted \(thisInputId)")
        serverApi.deleteData(inputId: thisInputId)
    }
}
