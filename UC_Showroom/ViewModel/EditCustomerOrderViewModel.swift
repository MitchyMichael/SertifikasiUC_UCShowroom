//
//  EditCustomerOrderView.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 12/11/23.
//

import Foundation

class EditCustomerOrderViewModel : ObservableObject {
    
    @Published var newFuelType: String = ""
    @Published var newTrunkSize: Int = 0
    @Published var newNumberOfWheels: Int = 0
    @Published var newCargoAreaSize: Int = 0
    @Published var newLuggageSize: Int = 0
    @Published var newFuelCapacity: Int = 0
    
}
