//
//  UserResponse.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

struct RepositoriesEntity: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [ItemEntity]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }

    init(totalCount: Int?, incompleteResults: Bool?, items: [ItemEntity]?) {
        self.totalCount = totalCount
        self.incompleteResults = incompleteResults
        self.items = items
    }
}
