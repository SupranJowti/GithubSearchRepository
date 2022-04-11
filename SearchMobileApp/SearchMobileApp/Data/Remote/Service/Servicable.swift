//
//  Servicable.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

protocol Servicable {
    func get<T:Decodable, V>(_ request:V, type:T.Type, completionHandler:@escaping(Result<T, ServiceError>)->Void) where V: BaseRequestProtocol
}
