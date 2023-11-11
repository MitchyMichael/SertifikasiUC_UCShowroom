//
//  VehicleType.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 12/11/23.
//

import Foundation

enum Type : String, CaseIterable, Identifiable {
    case Car, Motorcycle, Truck
    var id: Self { self }
}
