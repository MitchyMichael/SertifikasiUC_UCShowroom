//
//  VehicleServerApi.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import Foundation
import Alamofire

class VehicleServerApi : ObservableObject {
    @Published var vehicle: Vehicle?
    @Published var vehicles: [NewVehicle] = []
    
    func deleteVehicle(inputId: Int) {
        AF.request("http://localhost/uc_showroom_backend/vehicles/delete.php?id=\(inputId)", method: .delete).responseData { response in
            switch response.result {
            case .success(let success):
                guard let decodedData = try? JSONDecoder().decode(VehicleResponse.self, from: success) else {
                    return
                }
                self.vehicles = decodedData.data
                let stringDecoded = String(data: success, encoding: .utf8)
            case .failure (let failure):
                print(failure)
                return
            }
        }
    }
    
    func updateVehicle(vehicle: Vehicle) {
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(vehicle)
        
        AF.upload(jsonData!, to: "http://localhost/uc_showroom_backend/vehicles/update.php?id=\(vehicle.id)", method: .put)
        .response { response in
            switch response.result {
            case .success(let success):
                let stringDecoded = String(data: success!, encoding: .utf8)
                print(stringDecoded)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func createVehicleData(vehicle: Vehicle) {
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(vehicle.customerId.description.data(using: .utf8)!, withName: "customerId")
            multipartFormData.append(vehicle.type.data(using: .utf8)!, withName: "type")
            multipartFormData.append(vehicle.model.data(using: .utf8)!, withName: "model")
            multipartFormData.append(vehicle.year.description.data(using: .utf8)!, withName: "year")
            multipartFormData.append(vehicle.passengers.description.data(using: .utf8)!, withName: "passengerCount")
            multipartFormData.append(vehicle.manufacturer.data(using: .utf8)!, withName: "manufacturer")
            multipartFormData.append(vehicle.price.description.data(using: .utf8)!, withName: "price")
        }, to: "http://localhost/uc_showroom_backend/vehicles/create.php", method: .post)
        .response { response in
            print("test")
            switch response.result {
            case .success(let success):
                let stringDecoded = String(data: success!, encoding: .utf8)
                print(stringDecoded)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func getAllVehiclesData() {
        let url = "http://localhost/uc_showroom_backend/vehicles/read.php"
        AF.request(url, method: .get).responseData { response in
            print(response)
            
            switch response.result {
            case .success(let success):
                print("Disini \(success)")
                guard let decodedData = try? JSONDecoder().decode(VehicleResponse.self, from: success) else {
                    print("Failed to retrieve data")
                    return
                }
                self.vehicles = decodedData.data
                print(self.vehicles)
            case .failure (let failure):
                print(failure)
                return
            }
        }
    }
}
