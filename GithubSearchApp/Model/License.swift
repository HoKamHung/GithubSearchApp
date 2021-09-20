//
//  License.swift
//  GithubSearchApp
//
//  Created by Kam Hung Ho on 20/9/2021.
//

import Foundation

struct License: Codable {
    public var key:String?
    public var name:String?
    public var url:String?
    public var spdx_id:String?
    public var node_id:String?
//    public var html_url:String

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case url = "url"
        case spdx_id = "spdx_id"
        case node_id = "node_id"
//        case html_url = "html_url"
    }

    func encode(to encoder: Encoder) throws {
        throw(NSError(domain: "Not Implemented", code: 0, userInfo: nil))
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        key = try? container.decode(String.self, forKey: .key)
        name = try? container.decode(String.self, forKey: .name)
        url = try? container.decode(String.self, forKey: .url)
        spdx_id = try? container.decode(String.self, forKey: .spdx_id)
        node_id = try? container.decode(String.self, forKey: .node_id)
//        html_url = try container.decode(String.self, forKey: .html_url)
    }
}
