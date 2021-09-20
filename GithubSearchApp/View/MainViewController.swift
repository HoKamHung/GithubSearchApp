//
//  ViewController.swift
//  GithubSearchApp
//
//  Created by Kam Hung Ho on 20/9/2021.
//

import UIKit

class MainViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, MainViewModelDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var networkingIndicator: UIActivityIndicatorView!

    lazy var viewModel = {
        MainViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.delegate = self;
    }

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.searchItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MainCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.CellIdentifier, for: indexPath) as! MainCollectionViewCell

        let user = viewModel.searchItems[indexPath.row].owner
        DispatchQueue.global().async {
            if let avatar_url = user?.avatar_url,
               let imageURL = URL(string: avatar_url),
               let imageData = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    cell.imageView!.image = UIImage(data: imageData)
                }
            }
        }
        cell.title.text = viewModel.searchItems[indexPath.row].name
        cell.user.text = viewModel.searchItems[indexPath.row].owner?.login
        return cell
    }

    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        UIApplication.shared.open(URL(string: viewModel.searchItems[indexPath.row].html_url!)!)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = MainCollectionViewCell.CellSize(screenWidth: Int(UIScreen.main.bounds.size.width))
        print(size)
        return size
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.searchItems.count - 2,
           let searchBarText = self.searchBar.text{
            viewModel.search(searchBarText, page: viewModel.searchItems.count / HTTPHelper.resultPerPage, itemsPerPage: HTTPHelper.resultPerPage, force: true)
        }
    }


    // MARK: UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 0
        {
            viewModel.search(searchText)
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text,
           text.count > 0
        {
            viewModel.search(text, page: 0, itemsPerPage: HTTPHelper.resultPerPage, force: true)
        }

        searchBar.resignFirstResponder()
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        // out focus
        searchBar.resignFirstResponder()
    }

    // MARK: MainViewModelDelegate
    func MainViewModelOnDataRetrived() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    func MainViewModelOnErrorRetrived() {

    }

    func MainViewModelDidEndNetworkConnection() {
        DispatchQueue.main.async {
            self.networkingIndicator.stopAnimating()
        }
    }

    func MainViewModelWillStartNetworkConnection() {
        DispatchQueue.main.async {
            self.networkingIndicator.startAnimating()
        }
    }

}

