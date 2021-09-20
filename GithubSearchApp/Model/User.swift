//
//  Users.swift
//  GithubSearchApp
//
//  Created by Kam Hung Ho on 20/9/2021.
//

import Foundation

struct User: Codable{
    public var login:String?
    public var id:Int?
    public var node_id:String?
    public var avatar_url:String?
    public var gravatar_id:String?
    public var url:String?
    public var received_events_url:String?
    public var type:String?
    public var html_url:String?
    public var followers_url:String?
    public var following_url:String?
    public var gists_url:String?
    public var starred_url:String?
    public var subscriptions_url:String?
    public var organizations_url:String?
    public var repos_url:String?
    public var events_url:String?
    public var site_admin:Bool?

    enum CodingKeys:String, CodingKey {
        case login = "login"
        case id = "id"
        case node_id = "node_id"
        case  avatar_url = "avatar_url"
        case  gravatar_id = "gravatar_id"
        case  url = "url"
        case  received_events_url = "received_events_url"
        case  type = "type"
        case  html_url = "html_url"
        case  followers_url = "followers_url"
        case  following_url = "following_url"
        case  gists_url = "gists_url"
        case  starred_url = "starred_url"
        case  subscriptions_url = "subscriptions_url"
        case  organizations_url = "organizations_url"
        case  repos_url = "repos_url"
        case  events_url = "events_url"
        case  site_admin = "site_admin"
    }

    func encode(to encoder:Encoder) throws {
        throw(NSError(domain: "Not implemented", code: 0, userInfo: nil))
    }

    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        login = try? container.decode(String.self, forKey: .login)
        id = try? container.decode(Int.self, forKey: .id)
        node_id = try? container.decode(String.self, forKey: .node_id)
        avatar_url = try? container.decode(String.self, forKey: .avatar_url)
        gravatar_id = try? container.decode(String.self, forKey: .gravatar_id)
        url = try? container.decode(String.self, forKey: .url)
        received_events_url = try? container.decode(String.self, forKey: .received_events_url)
        type = try? container.decode(String.self, forKey: .type)
        html_url = try? container.decode(String.self, forKey: .html_url)
        followers_url = try? container.decode(String.self, forKey: .followers_url)
        following_url = try? container.decode(String.self, forKey: .following_url)
        gists_url = try? container.decode(String.self, forKey: .gists_url)
        starred_url = try? container.decode(String.self, forKey: .starred_url)
        subscriptions_url = try? container.decode(String.self, forKey: .subscriptions_url)
        organizations_url = try? container.decode(String.self, forKey: .organizations_url)
        repos_url = try? container.decode(String.self, forKey: .repos_url)
        events_url = try? container.decode(String.self, forKey: .events_url)
        site_admin = try? container.decode(Bool.self, forKey: .site_admin)
    }
}
