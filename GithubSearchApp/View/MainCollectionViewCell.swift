//
//  MainCollectionViewCell.swift
//  GithubSearchApp
//
//  Created by Kam Hung Ho on 20/9/2021.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static let CellIdentifier = "MainCollectionViewCell"
    static let DefaultCellSize: CGSize = CGSize(width: 200, height: 300)
    static let padding: Int = 14
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var user: UILabel!

    static func CellSize(screenWidth:Int) -> CGSize
    {
        let width = CGFloat((screenWidth / 2) - 14)
        let height = MainCollectionViewCell.DefaultCellSize.height * CGFloat(width) / MainCollectionViewCell.DefaultCellSize.width

        return CGSize(width: width, height: height)
    }
}
