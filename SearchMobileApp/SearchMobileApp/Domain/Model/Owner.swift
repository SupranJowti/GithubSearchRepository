//
//  OwnerEntity.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

struct Owner: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, receivedEventsURL: String?
    let type: String?
    let htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let siteAdmin: Bool?
}


extension OwnerEntity: ResponseConvertible {
    typealias Entity = Owner

    func convert() -> Entity {
        .init(login: login, id: id, nodeID: nodeID, avatarURL: avatarURL, gravatarID: gravatarID, url: url, receivedEventsURL: receivedEventsURL, type: type, htmlURL: htmlURL, followersURL: followersURL, followingURL: followingURL, gistsURL: gistsURL, starredURL: starredURL, subscriptionsURL: subscriptionsURL, organizationsURL: organizationsURL, reposURL: reposURL, eventsURL: eventsURL, siteAdmin: siteAdmin)
    }
}
