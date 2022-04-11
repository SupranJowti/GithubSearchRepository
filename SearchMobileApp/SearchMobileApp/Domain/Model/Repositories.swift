//
//  UserResponse.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

struct Repositories: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]?
}


extension RepositoriesEntity: ResponseConvertible {
    typealias Entity = Repositories

    func convert() -> Entity {
        .init(totalCount: totalCount, incompleteResults: incompleteResults, items: items.map {$0.convert()} )
    }
}
