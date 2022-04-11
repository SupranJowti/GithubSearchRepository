//
//  LicenseEntity.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

struct License: Codable {
    let key, name: String?
    let url: String?
    let spdxID, nodeID: String?
    let htmlURL: String?
}

extension LicenseEntity: ResponseConvertible {
    typealias Entity = License

    func convert() -> Entity {
        .init(key: key,
              name: name,
              url: url,
              spdxID: spdxID,
              nodeID: nodeID,
              htmlURL: htmlURL)
    }
}
