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
    @Published var vehicles: [NewVehicle] = [NewVehicle]()
    
    // To delete vehicle
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
    
    // To update car
    func updateCar(vehicle: Car) {
        print(vehicle)
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(vehicle)
        
        AF.upload(jsonData!, to: "http://localhost/uc_showroom_backend/vehicles/update.php?id=\(vehicle.baseInfo.id)", method: .put)
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
    
    // To update truck
    func updateTruck(vehicle: Truck) {
        print(vehicle)
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(vehicle)
        
        AF.upload(jsonData!, to: "http://localhost/uc_showroom_backend/vehicles/update.php?id=\(vehicle.baseInfo.id)", method: .put)
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
    
    // To update motorcycle
    func updateMotor(vehicle: Motorcycle) {
        print(vehicle)
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(vehicle)
        
        AF.upload(jsonData!, to: "http://localhost/uc_showroom_backend/vehicles/update.php?id=\(vehicle.baseInfo.id)", method: .put)
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
    
    // To create motorcycle
    func createMotorData(vehicle: Motorcycle) {
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(vehicle.baseInfo.customerId.description.data(using: .utf8)!, withName: "customerId")
            multipartFormData.append(vehicle.baseInfo.type.data(using: .utf8)!, withName: "type")
            multipartFormData.append(vehicle.baseInfo.model.data(using: .utf8)!, withName: "model")
            multipartFormData.append(vehicle.baseInfo.year.description.data(using: .utf8)!, withName: "year")
            multipartFormData.append(vehicle.baseInfo.passengers.description.data(using: .utf8)!, withName: "passengerCount")
            multipartFormData.append(vehicle.baseInfo.manufacturer.data(using: .utf8)!, withName: "manufacturer")
            multipartFormData.append(vehicle.baseInfo.price.description.data(using: .utf8)!, withName: "price")
            
            multipartFormData.append(vehicle.fuelCapacity.description.data(using: .utf8)!, withName: "fuelCapacity")
            multipartFormData.append(vehicle.luggageSize.description.data(using: .utf8)!, withName: "luggageSize")
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
    
    // To create truck
    func createTruckData(vehicle: Truck) {
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(vehicle.baseInfo.customerId.description.data(using: .utf8)!, withName: "customerId")
            multipartFormData.append(vehicle.baseInfo.type.data(using: .utf8)!, withName: "type")
            multipartFormData.append(vehicle.baseInfo.model.data(using: .utf8)!, withName: "model")
            multipartFormData.append(vehicle.baseInfo.year.description.data(using: .utf8)!, withName: "year")
            multipartFormData.append(vehicle.baseInfo.passengers.description.data(using: .utf8)!, withName: "passengerCount")
            multipartFormData.append(vehicle.baseInfo.manufacturer.data(using: .utf8)!, withName: "manufacturer")
            multipartFormData.append(vehicle.baseInfo.price.description.data(using: .utf8)!, withName: "price")
            
            multipartFormData.append(vehicle.cargoAreaSize.description.data(using: .utf8)!, withName: "cargoAreaSize")
            multipartFormData.append(vehicle.numberOfWheels.description.data(using: .utf8)!, withName: "wheelCount")
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
    
    // To create car
    func createCarData(vehicle: Car) {
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(vehicle.baseInfo.customerId.description.data(using: .utf8)!, withName: "customerId")
            multipartFormData.append(vehicle.baseInfo.type.data(using: .utf8)!, withName: "type")
            multipartFormData.append(vehicle.baseInfo.model.data(using: .utf8)!, withName: "model")
            multipartFormData.append(vehicle.baseInfo.year.description.data(using: .utf8)!, withName: "year")
            multipartFormData.append(vehicle.baseInfo.passengers.description.data(using: .utf8)!, withName: "passengerCount")
            multipartFormData.append(vehicle.baseInfo.manufacturer.data(using: .utf8)!, withName: "manufacturer")
            multipartFormData.append(vehicle.baseInfo.price.description.data(using: .utf8)!, withName: "price")
            
            multipartFormData.append(vehicle.fuelType.data(using: .utf8)!, withName: "fuelType")
            multipartFormData.append(vehicle.trunkSize.description.data(using: .utf8)!, withName: "trunkSize")
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
    
    // To get all vehicles
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
    
    func getDataByCustomerId(customerId: Int) {
        AF.request("http://localhost/uc_showroom_backend/vehicles/read.php?id=\(customerId)", method: .get).responseData { response in
            print(response)
            
            switch response.result {
            case .success(let success):
                print("Disini \(success)")
                guard let decodedData = try? JSONDecoder().decode(VehicleResponse.self, from: success) else {
                    print("Failed to retrieve data")
                    return
                }
                self.vehicles = decodedData.data
                print("Ini dia")
                print(self.vehicles)
            case .failure (let failure):
                print(failure)
                return
            }
        }
    }
}
