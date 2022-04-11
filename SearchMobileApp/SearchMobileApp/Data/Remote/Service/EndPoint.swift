//
//  EndPoint.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation


struct EndPoint {
    static let baseUrl = "https://api.github.com/search/"
    
    static var header: [String: String]? {
        return [
            "Accept":"application/json",
            "Content-Type":"application/json"
        ]
    }
}

struct Path {
    static let repositories = "repositories"
}

