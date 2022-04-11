//
//  ItemEntity.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

struct Item: Codable {
    let id: Int?
    let nodeID, name, fullName: String?
    let owner: Owner?
    let itemPrivate: Bool?
    let htmlURL: String?
    let itemDescription: String?
    let fork: Bool?
    let url: String?
    let createdAt, updatedAt, pushedAt: String?
    let homepage: String??
    let size, stargazersCount, watchersCount: Int?
    let language: String?
    let forksCount, openIssuesCount: Int?
    let masterBranch, defaultBranch: String??
    let score: Int?
    let archiveURL, assigneesURL, blobsURL, branchesURL: String?
    let collaboratorsURL, commentsURL, commitsURL, compareURL: String?
    let contentsURL: String?
    let contributorsURL, deploymentsURL, downloadsURL, eventsURL: String?
    let forksURL: String?
    let gitCommitsURL, gitRefsURL, gitTagsURL, gitURL: String?
    let issueCommentURL, issueEventsURL, issuesURL, keysURL: String?
    let labelsURL: String?
    let languagesURL, mergesURL: String?
    let milestonesURL, notificationsURL, pullsURL, releasesURL: String?
    let sshURL: String?
    let stargazersURL: String?
    let statusesURL: String?
    let subscribersURL, subscriptionURL, tagsURL, teamsURL: String?
    let treesURL: String?
    let cloneURL: String?
    let mirrorURL: String?
    let hooksURL, svnURL: String?
    let forks, openIssues, watchers: Int?
    let hasIssues, hasProjects, hasPages, hasWiki: Bool?
    let hasDownloads, archived, disabled: Bool?
    let visibility: String?
    let license: License?
}


extension ItemEntity: ResponseConvertible {
    typealias Entity = Item

    func convert() -> Entity {
        .init(id: id, nodeID: nodeID, name: name, fullName: fullName, owner: owner?.convert(), itemPrivate: itemPrivate, htmlURL: htmlURL, itemDescription: itemDescription, fork: fork, url: url, createdAt: createdAt, updatedAt: updatedAt, pushedAt: pushedAt, homepage: homepage, size: size, stargazersCount: stargazersCount, watchersCount: watchersCount, language: language, forksCount: forksCount, openIssuesCount: openIssuesCount, masterBranch: masterBranch, defaultBranch: defaultBranch, score: score, archiveURL: archiveURL, assigneesURL: assigneesURL, blobsURL: blobsURL, branchesURL: branchesURL, collaboratorsURL: collaboratorsURL, commentsURL: commentsURL, commitsURL: commitsURL, compareURL: compareURL, contentsURL: contentsURL, contributorsURL: contributorsURL, deploymentsURL: deploymentsURL, downloadsURL: downloadsURL, eventsURL: eventsURL, forksURL: forksURL, gitCommitsURL: gitCommitsURL, gitRefsURL: gitRefsURL, gitTagsURL: gitTagsURL, gitURL: gitURL, issueCommentURL: issueCommentURL, issueEventsURL: issueEventsURL, issuesURL: issuesURL, keysURL: keysURL, labelsURL: labelsURL, languagesURL: languagesURL, mergesURL: mergesURL, milestonesURL: milestonesURL, notificationsURL: notificationsURL, pullsURL: pullsURL, releasesURL: releasesURL, sshURL: sshURL, stargazersURL: stargazersURL, statusesURL: statusesURL, subscribersURL: subscribersURL, subscriptionURL: subscriptionURL, tagsURL: tagsURL, teamsURL: teamsURL, treesURL: treesURL, cloneURL: cloneURL, mirrorURL: mirrorURL, hooksURL: hooksURL, svnURL: svnURL, forks: forks, openIssues: openIssues, watchers: watchers, hasIssues: hasIssues, hasProjects: hasProjects, hasPages: hasPages, hasWiki: hasWiki, hasDownloads: hasDownloads, archived: archived, disabled: disabled, visibility: visibility, license: license?.convert())
    }
}
