//
//  LicenseEntity.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

struct LicenseEntity: Codable {
    let key, name: String?
    let url: String?
    let spdxID, nodeID: String?
    let htmlURL: String?

    enum CodingKeys: String, CodingKey {
        case key, name, url
        case spdxID = "spdx_id"
        case nodeID = "node_id"
        case htmlURL = "html_url"
    }

    init(key: String?, name: String?, url: String?, spdxID: String?, nodeID: String?, htmlURL: String?) {
        self.key = key
        self.name = name
        self.url = url
        self.spdxID = spdxID
        self.nodeID = nodeID
        self.htmlURL = htmlURL
    }
}
