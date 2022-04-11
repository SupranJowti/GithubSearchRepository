//
//  SearchRepository.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

protocol SearchRepository {
    func searchRepository(query: String, completionHandler:@escaping(Result<Repositories, ServiceError>)->Void)
}


final class SearchRepositoryImpl: SearchRepository {
    private var serviceManager: Servicable
    
    init(serviceManager: Servicable = ServiceManager()) {
        self.serviceManager = serviceManager
    }
    
    func searchRepository(query: String, completionHandler:@escaping(Result<Repositories, ServiceError>)->Void) {
        serviceManager.get(SearchRepositoryRequest(query: query), type: SearchRepositoryRequest.ResponseType.self)
        { result in
            switch result {
            case .success(let response) :
                completionHandler(.success(response.convert()))
            case .failure(let error) :
                completionHandler(.failure(error))
            }
        }
    }
    
    
}
