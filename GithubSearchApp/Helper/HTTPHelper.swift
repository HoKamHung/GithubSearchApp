//
//  HTTPHelper.swift
//  GithubSearchApp
//
//  Created by Kam Hung Ho on 20/9/2021.
//

import Foundation

protocol HTTPHelperDelegate
{
    func HTTPHelperOnRequestError(error:Error)
    func HTTPHelperOnResponse()
    func HTTPHelperOnSearchItemReceived(items: [SearchItem], page:Int)
}

extension Date {
    static func - (firstDate: Date, secondDate: Date) -> TimeInterval {
        return abs(firstDate.timeIntervalSinceReferenceDate - secondDate.timeIntervalSinceReferenceDate)
    }
}

public class HTTPHelper
{
    private static let APIRequest = "https://api.github.com/search/repositories"
    private static let urlSession: URLSession = URLSession(configuration: .default)
    private static var dataTask: URLSessionDataTask?

    private static var result:Int = 0
    public static let resultPerPage:Int = 30
    public static var page:Int = 0
    private static var incomplete: Bool = false

    private static var executeTime:Date?

    static func request(_ query: String, page:Int = 0, delegate:HTTPHelperDelegate?, force: Bool = false)
    {
        if !force,
           let compareTime = executeTime,
           Date() - compareTime < 2
        {
            return
        }

        if force,
           dataTask?.state == .running {
            dataTask?.cancel()
        }

        if var component:URLComponents = URLComponents(string: APIRequest) {
            component.queryItems = [
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "page", value: "\(page)")
            ]
            component.percentEncodedQuery = component.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")

            let request = URLRequest(url: component.url!)
            dataTask = urlSession.dataTask(with: request) { data, response, error in
                defer {
                    dataTask = nil
                }
                
                if
                    let error = error {
                    delegate?.HTTPHelperOnRequestError(error: error)
                }
                else if
                    let data = data,
                    let response = response as? HTTPURLResponse,
                    200 ..< 300 ~= response.statusCode {
                    delegate?.HTTPHelperOnResponse()

                    let decoder = JSONDecoder()

                    do {
                        let search:Search = try decoder.decode(Search.self, from: data)
                        self.result = search.total_count
                        self.incomplete = search.incomplete_results
                        delegate?.HTTPHelperOnSearchItemReceived(items:search.items, page: page)

                    } catch {
                        print("\(error)")
                    }
                }
                else if
                    let response = response as? HTTPURLResponse,
                    !(200 ..< 300 ~= response.statusCode) {
                    // Error Handling of HTTP response.
                    let _error = NSError(domain: "", code: response.statusCode, userInfo: nil)
                    delegate?.HTTPHelperOnRequestError(error: _error as Error)
                }
            }
        }
        dataTask?.resume()
        executeTime = Date()
    }
}
