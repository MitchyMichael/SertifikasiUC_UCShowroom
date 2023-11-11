//
//  CustomerServerApi.swift
//  UC_Showroom
//
//  Created by Michael Wijaya Sutrisna on 11/11/23.
//

import Foundation
import Alamofire

class CustomerServerApi : ObservableObject {
    @Published var customer: Customer?
    @Published var customers: [NewCustomer] = []
    
    func deleteData(inputId: Int) {
        print("Masuk delete")
        AF.request("http://localhost/uc_showroom_backend/customers/delete.php?id=\(inputId)", method: .delete).responseData { response in
            switch response.result {
            case .success(let success):
                guard let decodedData = try? JSONDecoder().decode(CustomersResponse.self, from: success) else {
                    return
                }
                self.customers = decodedData.data
                let stringDecoded = String(data: success, encoding: .utf8)
                print(success)
                print(stringDecoded)
            case .failure (let failure):
                print(failure)
                return
            }
        }
    }
    
    func updateData(customer: Customer) {
        print(customer)
        
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(customer)
        
        AF.upload(jsonData!, to: "http://localhost/uc_showroom_backend/customers/update.php?id=\(customer.id)", method: .put)
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
    
    func createCustomerData(customer: Customer) {
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(customer.name.data(using: .utf8)!, withName: "name")
            multipartFormData.append(customer.address.data(using: .utf8)!, withName: "address")
            multipartFormData.append(customer.phoneNumber.data(using: .utf8)!, withName: "phoneNumber")
            multipartFormData.append(customer.idCard.data(using: .utf8)!, withName: "idCard")
        }, to: "http://localhost/uc_showroom_backend/customers/create.php", method: .post)
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
    
    func getAllCustomerData() {
        AF.request("http://localhost/uc_showroom_backend/customers/read.php", method: .get).responseData { response in
            print(response)
            
            switch response.result {
            case .success(let success):
                print("Disini \(success)")
                guard let decodedData = try? JSONDecoder().decode(CustomersResponse.self, from: success) else {
                    print("Failed to retrieve data")
                    return
                }
                self.customers = decodedData.data
            case .failure (let failure):
                print(failure)
                return
            }
        }
    }
}
