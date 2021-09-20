//
//  SearchItems.swift
//  GithubSearchApp
//
//  Created by Kam Hung Ho on 20/9/2021.
//

import Foundation

struct SearchItem: Codable {
    public var id:Int?
    public var node_id:String?
    public var name:String?
    public var full_name:String?
    public var owner:User?
    public var `private`:Bool?
    public var html_url:String?
    public var description:String?
    public var fork:Bool?
    public var url:String?
    public var created_at:Date?
    public var updated_at:Date?
    public var pushed_at:Date?
    public var homepage:String?
    public var size:Int?
    public var stargazers_count:Int?
    public var watchers_count:Int?
    public var language:String?
    public var forks_count:Int?
    public var open_issues_count:Int?
//    public var master_branch:String
    public var default_branch:String?
    public var score:Int?
    public var archive_url:String?
    public var assignees_url:String?
    public var blobs_url:String?
    public var branches_url:String?
    public var collaborators_url:String?
    public var comments_url:String?
    public var commits_url:String?
    public var compare_url:String?
    public var contents_url:String?
    public var contributors_url:String?
    public var deployments_url:String?
    public var downloads_url:String?
    public var events_url:String?
    public var forks_url:String?
    public var git_commits_url:String?
    public var git_refs_url:String?
    public var git_tags_url:String?
    public var git_url:String?
    public var issue_comment_url:String?
    public var issue_events_url:String?
    public var issues_url:String?
    public var keys_url:String?
    public var labels_url:String?
    public var languages_url:String?
    public var merges_url:String?
    public var milestones_url:String?
    public var notifications_url:String?
    public var pulls_url:String?
    public var releases_url:String?
    public var ssh_url:String?
    public var stargazers_url:String?
    public var statuses_url:String?
    public var subscribers_url:String?
    public var subscription_url:String?
    public var tags_url:String?
    public var teams_url:String?
    public var trees_url:String?
    public var clone_url:String?
//    public var mirror_url:String
    public var hooks_url:String?
    public var svn_url:String?
    public var forks:Int?
    public var open_issues:Int?
    public var watchers:Int?
    public var has_issues:Bool?
    public var has_projects:Bool?
    public var has_pages:Bool?
    public var has_wiki:Bool?
    public var has_downloads:Bool?
    public var archived:Bool?
    public var disabled:Bool?
    public var license:License?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case node_id = "node_id"
        case name = "name"
        case full_name = "full_name"
        case owner = "owner"
        case `private` = "private"
        case html_url = "html_url"
        case description = "description"
        case fork = "fork"
        case url = "url"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case pushed_at = "pushed_at"
        case homepage = "homepage"
        case size = "size"
        case stargazers_count = "stargazers_count"
        case watchers_count = "watchers_count"
        case language = "language"
        case forks_count = "forks_count"
        case open_issues_count = "open_issues_count"
//        case master_branch = "master_branch"
        case default_branch = "default_branch"
        case score = "score"
        case archive_url = "archive_url"
        case assignees_url = "assignees_url"
        case blobs_url = "blobs_url"
        case branches_url = "branches_url"
        case collaborators_url = "collaborators_url"
        case comments_url = "comments_url"
        case commits_url = "commits_url"
        case compare_url = "compare_url"
        case contents_url = "contents_url"
        case contributors_url = "contributors_url"
        case deployments_url = "deployments_url"
        case downloads_url = "downloads_url"
        case events_url = "events_url"
        case forks_url = "forks_url"
        case git_commits_url = "git_commits_url"
        case git_refs_url = "git_refs_url"
        case git_tags_url = "git_tags_url"
        case git_url = "git_url"
        case issue_comment_url = "issue_comment_url"
        case issue_events_url = "issue_events_url"
        case issues_url = "issues_url"
        case keys_url = "keys_url"
        case labels_url = "labels_url"
        case languages_url = "languages_url"
        case merges_url = "merges_url"
        case milestones_url = "milestones_url"
        case notifications_url = "notifications_url"
        case pulls_url = "pulls_url"
        case releases_url = "releases_url"
        case ssh_url = "ssh_url"
        case stargazers_url = "stargazers_url"
        case statuses_url = "statuses_url"
        case subscribers_url  = "subscribers_url"
        case subscription_url = "subscription_url"
        case tags_url = "tags_url"
        case teams_url = "teams_url"
        case trees_url = "trees_url"
        case clone_url = "clone_url"
//        case mirror_url = "mirror_url"
        case hooks_url = "hooks_url"
        case svn_url = "svn_url"
        case forks = "forks"
        case open_issues = "open_issues"
        case watchers = "watchers"
        case has_issues = "has_issues"
        case has_projects = "has_projects"
        case has_pages = "has_pages"
        case has_wiki = "has_wiki"
        case has_downloads = "has_downloads"
        case archived = "archived"
        case disabled = "disabled"
        case license = "license"
    }

    init(from decoder:Decoder) throws {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try? container.decode(Int.self, forKey: .id)
        node_id = try? container.decode(String.self, forKey: .node_id)
        name = try? container.decode(String.self, forKey: .name)
        full_name = try? container.decode(String.self, forKey: .full_name)
        owner = try? container.decode(User.self, forKey: .owner)
        `private` = try? container.decode(Bool.self, forKey: .private)
        html_url = try? container.decode(String.self, forKey: .html_url)
        description = try? container.decode(String.self, forKey: .description)
        fork = try? container.decode(Bool.self, forKey: .fork)
        url = try? container.decode(String.self, forKey: .url)
        created_at = dateFormatter.date(from: try container.decode(String.self, forKey: .created_at)) ?? Date()
        updated_at = dateFormatter.date(from: try container.decode(String.self, forKey: .updated_at)) ?? Date()
        pushed_at = dateFormatter.date(from: try container.decode(String.self, forKey: .pushed_at)) ?? Date()
        homepage = try? container.decode(String.self, forKey: .homepage)
        size = try? container.decode(Int.self, forKey: .size)
        stargazers_count = try? container.decode(Int.self, forKey: .stargazers_count)
        watchers_count = try? container.decode(Int.self, forKey: .watchers_count)
        language = try? container.decode(String.self, forKey: .language)
        forks_count = try? container.decode(Int.self, forKey: .forks_count)
        open_issues_count = try? container.decode(Int.self, forKey: .open_issues_count)
//        master_branch = try? container.decode(String.self, forKey: .master_branch)
        default_branch = try? container.decode(String.self, forKey: .default_branch)
        score = try? container.decode(Int.self, forKey: .score)
        archive_url = try? container.decode(String.self, forKey: .archive_url)
        assignees_url = try? container.decode(String.self, forKey: .assignees_url)
        blobs_url = try? container.decode(String.self, forKey: .blobs_url)
        branches_url =  try? container.decode(String.self, forKey: .branches_url)
        collaborators_url = try? container.decode(String.self, forKey: .collaborators_url)
        comments_url = try? container.decode(String.self, forKey: .commits_url)
        commits_url = try? container.decode(String.self, forKey: .commits_url)
        compare_url = try? container.decode(String.self, forKey: .compare_url)
        contents_url = try? container.decode(String.self, forKey: .contents_url)
        contributors_url = try? container.decode(String.self, forKey: .contributors_url)
        deployments_url = try? container.decode(String.self, forKey: .deployments_url)
        downloads_url = try? container.decode(String.self, forKey: .downloads_url)
        events_url = try? container.decode(String.self, forKey: .events_url)
        forks_url = try? container.decode(String.self, forKey: .forks_url)
        git_commits_url = try? container.decode(String.self, forKey: .git_commits_url)
        git_refs_url = try? container.decode(String.self, forKey: .git_refs_url)
        git_tags_url = try? container.decode(String.self, forKey: .git_tags_url)
        git_url = try? container.decode(String.self, forKey: .git_url)
        issue_comment_url = try? container.decode(String.self, forKey: .issue_comment_url)
        issue_events_url = try? container.decode(String.self, forKey: .issue_events_url)
        issues_url = try? container.decode(String.self, forKey: .issues_url)
        keys_url = try? container.decode(String.self, forKey: .keys_url)
        labels_url = try? container.decode(String.self, forKey: .labels_url)
        languages_url = try? container.decode(String.self, forKey: .languages_url)
        merges_url = try? container.decode(String.self, forKey: .merges_url)
        milestones_url = try? container.decode(String.self, forKey: .milestones_url)
        notifications_url = try? container.decode(String.self, forKey: .notifications_url)
        pulls_url = try? container.decode(String.self, forKey: .pulls_url)
        releases_url = try? container.decode(String.self, forKey: .releases_url)
        ssh_url = try? container.decode(String.self, forKey: .ssh_url)
        stargazers_url = try? container.decode(String.self, forKey: .stargazers_url)
        statuses_url = try? container.decode(String.self, forKey: .statuses_url)
        subscribers_url  = try? container.decode(String.self, forKey: .subscribers_url)
        subscription_url = try? container.decode(String.self, forKey: .subscription_url)
        tags_url = try? container.decode(String.self, forKey: .tags_url)
        teams_url = try? container.decode(String.self, forKey: .teams_url)
        trees_url = try? container.decode(String.self, forKey: .trees_url)
        clone_url = try? container.decode(String.self, forKey: .clone_url)
//        mirror_url = try? container.decode(String.self, forKey: .mirror_url)
        hooks_url = try? container.decode(String.self, forKey: .hooks_url)
        svn_url = try? container.decode(String.self, forKey: .svn_url)
        forks = try? container.decode(Int.self, forKey: .forks)
        open_issues = try? container.decode(Int.self, forKey: .open_issues)
        watchers = try? container.decode(Int.self, forKey: .watchers)
        has_issues = try? container.decode(Bool.self, forKey: .has_issues)
        has_projects = try? container.decode(Bool.self, forKey: .has_projects)
        has_pages = try? container.decode(Bool.self, forKey: .has_pages)
        has_wiki = try? container.decode(Bool.self, forKey: .has_wiki)
        has_downloads = try? container.decode(Bool.self, forKey: .has_downloads)
        archived = try? container.decode(Bool.self, forKey: .archived)
        disabled = try? container.decode(Bool.self, forKey: .disabled)
        license = try? container.decode(License.self, forKey: .license)
    }

    func encode(to encoder: Encoder) throws {
        throw(NSError(domain: "Not implemented", code: 0, userInfo: nil))
    }
}

/*

 {
   "total_count": 40,
   "incomplete_results": false,
   "items": [
     {
       "id": 3081286,
       "node_id": "MDEwOlJlcG9zaXRvcnkzMDgxMjg2",
       "name": "Tetris",
       "full_name": "dtrupenn/Tetris",
       "owner": {
...
       },
       "private": false,
       "html_url": "https://github.com/dtrupenn/Tetris",
       "description": "A C implementation of Tetris using Pennsim through LC4",
       "fork": false,
       "url": "https://api.github.com/repos/dtrupenn/Tetris",
       "created_at": "2012-01-01T00:31:50Z",
       "updated_at": "2013-01-05T17:58:47Z",
       "pushed_at": "2012-01-01T00:37:02Z",
       "homepage": "https://github.com",
       "size": 524,
       "stargazers_count": 1,
       "watchers_count": 1,
       "language": "Assembly",
       "forks_count": 0,
       "open_issues_count": 0,
       "master_branch": "master",
       "default_branch": "master",
       "score": 1,
       "archive_url": "https://api.github.com/repos/dtrupenn/Tetris/{archive_format}{/ref}",
       "assignees_url": "https://api.github.com/repos/dtrupenn/Tetris/assignees{/user}",
       "blobs_url": "https://api.github.com/repos/dtrupenn/Tetris/git/blobs{/sha}",
       "branches_url": "https://api.github.com/repos/dtrupenn/Tetris/branches{/branch}",
       "collaborators_url": "https://api.github.com/repos/dtrupenn/Tetris/collaborators{/collaborator}",
       "comments_url": "https://api.github.com/repos/dtrupenn/Tetris/comments{/number}",
       "commits_url": "https://api.github.com/repos/dtrupenn/Tetris/commits{/sha}",
       "compare_url": "https://api.github.com/repos/dtrupenn/Tetris/compare/{base}...{head}",
       "contents_url": "https://api.github.com/repos/dtrupenn/Tetris/contents/{+path}",
       "contributors_url": "https://api.github.com/repos/dtrupenn/Tetris/contributors",
       "deployments_url": "https://api.github.com/repos/dtrupenn/Tetris/deployments",
       "downloads_url": "https://api.github.com/repos/dtrupenn/Tetris/downloads",
       "events_url": "https://api.github.com/repos/dtrupenn/Tetris/events",
       "forks_url": "https://api.github.com/repos/dtrupenn/Tetris/forks",
       "git_commits_url": "https://api.github.com/repos/dtrupenn/Tetris/git/commits{/sha}",
       "git_refs_url": "https://api.github.com/repos/dtrupenn/Tetris/git/refs{/sha}",
       "git_tags_url": "https://api.github.com/repos/dtrupenn/Tetris/git/tags{/sha}",
       "git_url": "git:github.com/dtrupenn/Tetris.git",
       "issue_comment_url": "https://api.github.com/repos/dtrupenn/Tetris/issues/comments{/number}",
       "issue_events_url": "https://api.github.com/repos/dtrupenn/Tetris/issues/events{/number}",
       "issues_url": "https://api.github.com/repos/dtrupenn/Tetris/issues{/number}",
       "keys_url": "https://api.github.com/repos/dtrupenn/Tetris/keys{/key_id}",
       "labels_url": "https://api.github.com/repos/dtrupenn/Tetris/labels{/name}",
       "languages_url": "https://api.github.com/repos/dtrupenn/Tetris/languages",
       "merges_url": "https://api.github.com/repos/dtrupenn/Tetris/merges",
       "milestones_url": "https://api.github.com/repos/dtrupenn/Tetris/milestones{/number}",
       "notifications_url": "https://api.github.com/repos/dtrupenn/Tetris/notifications{?since,all,participating}",
       "pulls_url": "https://api.github.com/repos/dtrupenn/Tetris/pulls{/number}",
       "releases_url": "https://api.github.com/repos/dtrupenn/Tetris/releases{/id}",
       "ssh_url": "git@github.com:dtrupenn/Tetris.git",
       "stargazers_url": "https://api.github.com/repos/dtrupenn/Tetris/stargazers",
       "statuses_url": "https://api.github.com/repos/dtrupenn/Tetris/statuses/{sha}",
       "subscribers_url": "https://api.github.com/repos/dtrupenn/Tetris/subscribers",
       "subscription_url": "https://api.github.com/repos/dtrupenn/Tetris/subscription",
       "tags_url": "https://api.github.com/repos/dtrupenn/Tetris/tags",
       "teams_url": "https://api.github.com/repos/dtrupenn/Tetris/teams",
       "trees_url": "https://api.github.com/repos/dtrupenn/Tetris/git/trees{/sha}",
       "clone_url": "https://github.com/dtrupenn/Tetris.git",
       "mirror_url": "git:git.example.com/dtrupenn/Tetris",
       "hooks_url": "https://api.github.com/repos/dtrupenn/Tetris/hooks",
       "svn_url": "https://svn.github.com/dtrupenn/Tetris",
       "forks": 1,
       "open_issues": 1,
       "watchers": 1,
       "has_issues": true,
       "has_projects": true,
       "has_pages": true,
       "has_wiki": true,
       "has_downloads": true,
       "archived": true,
       "disabled": true,
       "license": {
         "key": "mit",
         "name": "MIT License",
         "url": "https://api.github.com/licenses/mit",
         "spdx_id": "MIT",
         "node_id": "MDc6TGljZW5zZW1pdA==",
         "html_url": "https://api.github.com/licenses/mit"
       }
     }
   ]
 }
 Not modified

 Status: 304 Not Modified



 */

