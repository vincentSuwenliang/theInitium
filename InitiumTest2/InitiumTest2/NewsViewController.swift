//
//  ViewController.swift
//  InitiumTest2
//
//  Created by SuVincent on 29/3/2017.
//  Copyright © 2017 SuVincent. All rights reserved.
//

import UIKit

final class NewsViewController: UIViewController {
    private var collectionView: UICollectionView!
    fileprivate let news = [["channel":"美國大選", "headline":"最後的「超級星期二」前，美聯社稱希拉莉鎖定民主黨總統候選人"],["channel":"香港", "headline":"回望菜園村，我看到推土機前的柔韌力量"]]
    fileprivate let cellIndentifier = "newsCardCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.width * 2 / 5)
        layout.scrollDirection = .vertical

        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(NewsCardCell.self, forCellWithReuseIdentifier: cellIndentifier)

        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
    }

}

extension NewsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let newsCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIndentifier, for: indexPath) as? NewsCardCell else {
            return UICollectionViewCell()
        }
        newsCardCell.backgroundColor = UIColor.lightGray
        let data = news[indexPath.row]
        newsCardCell.setCell(channel: data["channel"], headline: data["headline"])

        return newsCardCell

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 5
    }

}

