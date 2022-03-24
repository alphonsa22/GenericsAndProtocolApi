//
//  ApiManager.swift
//  GenericsAndProtocolApi
//
//  Created by Alphonsa Varghese on 23/03/22.
//

import Foundation


class ApiManager: NSObject {
    
    let baseurl = AppUrl.BaseUrl.dev.rawValue
    typealias EndPoint = AppUrl.Endpoint
    typealias Method = AppUrl.Method
    typealias APIError = AppUrl.APIError
    
    func request(endPoint: EndPoint, method: Method)-> URLRequest {
        let path = "\(baseurl)\(endPoint.rawValue)"
        guard let url = URL(string: path) else {
            preconditionFailure("Bad URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
    
        return request
    }
    
    func get<T:Codable>(endPoint: EndPoint, method: Method, expecting: T.Type, completion: @escaping((Result<T,APIError>)->Void)) {
        
        let urlRequest = request(endPoint: endPoint, method: method)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil
            else { completion(.failure(.serverError))
                return
            }
            do {
                guard let data = data
                else {
                    completion(Result.failure(.serverError))
                    return
                }
                let object = try JSONDecoder().decode(expecting, from: data)
                completion(Result.success(object))
            } catch {
                completion(Result.failure(.parsingError))
            }
            
        }
        dataTask.resume()
    }
}
