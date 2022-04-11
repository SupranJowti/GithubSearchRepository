//
//  SearchRequest.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/11.
//

import Foundation


struct SearchRepositoryRequest: BaseRequestProtocol {
    typealias ResponseType = RepositoriesEntity

    private let q: String

    var method: String {
        "GET"
    }

    var path: String {
        "repositories"
    }

    var parameters: [String:String]? {
        ["q": "in:name+\(q)"]
    }

    init(query: String) {
        self.q = query
    }
}
