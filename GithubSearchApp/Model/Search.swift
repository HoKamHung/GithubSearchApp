//
//  SearchModel.swift
//  GithubSearchApp
//
//  Created by Kam Hung Ho on 20/9/2021.
//

import Foundation

struct Search: Codable
{
    let total_count:Int
    let incomplete_results:Bool
    let items: [SearchItem]

    enum CodingKeys: String, CodingKey
    {
        case total_count = "total_count"
        case incomplete_results = "incomplete_results"
        case items = "items"
    }

    func encode(to encoder:Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(total_count, forKey: .total_count)
        try container.encode(incomplete_results, forKey: .incomplete_results)
        try container.encode(items, forKey: .items)
    }

    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        total_count = try container.decode(Int.self, forKey: .total_count)
        incomplete_results = try container.decode(Bool.self, forKey: .incomplete_results)
        items = try container.decode([SearchItem].self, forKey: .items)
    }
}
