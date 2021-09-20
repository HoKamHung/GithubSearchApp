//
//  MainViewModel.swift
//  GithubSearchApp
//
//  Created by Kam Hung Ho on 20/9/2021.
//

import Foundation

protocol MainViewModelDelegate
{
    func MainViewModelWillStartNetworkConnection()
    func MainViewModelDidEndNetworkConnection()
    func MainViewModelOnDataRetrived()
    func MainViewModelOnErrorRetrived()
}

public class MainViewModel: HTTPHelperDelegate
{
    var searchItems: [SearchItem] = []
    var delegate: MainViewModelDelegate?

    func HTTPHelperOnSearchItemReceived(items: [SearchItem], page: Int) {
        if page == 0
        {
            searchItems.removeAll()
        }
        searchItems.insert(contentsOf: items, at: HTTPHelper.resultPerPage * page)
        delegate?.MainViewModelOnDataRetrived()
        delegate?.MainViewModelDidEndNetworkConnection()
    }

    func HTTPHelperOnRequestError(error: Error) {
        delegate?.MainViewModelOnErrorRetrived()
    }

    func HTTPHelperOnResponse() { }

    func search(_ query:String, page:Int = 0, itemsPerPage:Int = 30, force:Bool = false) {
        delegate?.MainViewModelWillStartNetworkConnection()
        HTTPHelper.request(query, page: page, delegate: self, force: force)
    }
}
