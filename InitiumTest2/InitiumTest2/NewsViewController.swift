//
//  ViewController.swift
//  InitiumTest2
//
//  Created by SuVincent on 29/3/2017.
//  Copyright © 2017 SuVincent. All rights reserved.
//

import UIKit

final class NewsViewController: UIViewController {
    private var newsTableView: UITableView!
    fileprivate let news = [["channel":"美國大選", "headline":"最後的「超級星期二」前，美聯社稱希拉莉鎖定民主黨總統候選人"],["channel":"香港", "headline":"回望菜園村，我看到推土機前的柔韌力量"]]
    fileprivate let cellIndentifier = "newsCardCell"
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"

        newsTableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        newsTableView.register(NewsCardCell.self, forCellReuseIdentifier: cellIndentifier)
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.tableFooterView = UIView()
        // for eliminate extra separators below UITableView
        self.view.addSubview(newsTableView)
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let newsCardCell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as? NewsCardCell else {
            return UITableViewCell()
        }
        let data = news[indexPath.section]
        newsCardCell.setCell(channel: data["channel"], headline: data["headline"])

        return newsCardCell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(5)
    }

    // make header backgroud color be clear instead of default gray
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (screenWidth * 2 / 5)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.lightGray
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

