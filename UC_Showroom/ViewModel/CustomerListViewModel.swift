//
//  CustomerListViewModel.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 16/11/23.
//

import Foundation

class CustomerListViewModel : ObservableObject {
    func forTrailingZero(_ temp: Double) -> String {
        var tempVar = String(format: "%.f", temp)
        return tempVar
    }
}
