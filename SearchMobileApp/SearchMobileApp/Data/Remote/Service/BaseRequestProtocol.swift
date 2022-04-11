//
//  ServiceRequest.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

protocol BaseRequestProtocol: BaseAPIProtocol {
    var parameters: [String:String]? { get }
}

extension BaseRequestProtocol {

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = (parameters ?? [:]).map { element in URLQueryItem(name: element.key.description, value: element.value.description) }
        
        var urlRequest = URLRequest(url: components?.url ?? url)
        urlRequest.httpMethod = method
        
        if let h = headers {
            for key in h.keys {
                urlRequest.setValue(
                    h[key],
                    forHTTPHeaderField: key
                )
            }
        }
        return urlRequest
    }
}
