//
//  ServiceManager.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

class ServiceManager: Servicable {
    func get<T, V>(_ request:V, type: T.Type, completionHandler: @escaping (Result<T, ServiceError>) -> Void) where T : Decodable, V: BaseRequestProtocol {
        
        do {
            
            let urlSession = URLSession.shared
            let dataTask = urlSession.dataTask(with: try request.asURLRequest()) { data, urlResponse, error in
                guard let _data = data else {
                    completionHandler(.failure(ServiceError.serviceNotAvailable))
                    return
                }
                do {
                    let users =  try JSONDecoder().decode(T.self, from: _data)
                    completionHandler(.success(users))
                } catch let error {
                    debugPrint(error)
                    completionHandler(.failure(ServiceError.parsingFailed))
                }
            }
            dataTask.resume()
            
        }catch {
            completionHandler(.failure(ServiceError.requestNotFormatted))
        }
    }
}
