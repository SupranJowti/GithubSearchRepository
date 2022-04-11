//
//  BaseAPIProtocol.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

protocol BaseAPIProtocol {
    associatedtype ResponseType
    var method: String { get }
    var baseURL: URL { get }
    var path: String { get }
    var headers: [String: String]? { get }
}

extension BaseAPIProtocol {
    
    var baseURL: URL {
        return URL(string: EndPoint.baseUrl)!
    }

    var headers: [String: String]? {
        return EndPoint.header
    }
    
}

