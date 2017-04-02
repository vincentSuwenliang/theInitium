//
//  NewsCardCell.swift
//  InitiumTest2
//
//  Created by SuVincent on 29/3/2017.
//  Copyright © 2017 SuVincent. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    func addTopBorder(color: UIColor, height: CGFloat) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.masksToBounds = true
        self.layer.addSublayer(border)
    }
}

extension UILabel {
    class func newsCellLabel(fontSize: CGFloat, numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = UIColor.white
        label.textAlignment = .natural
        label.numberOfLines = numberOfLines
        label.sizeToFit()
        label.lineBreakMode = .byTruncatingTail

        return label
    }
}

class NewsCardCell: UITableViewCell {

    private var channelView = UIView()
    private var channelLabel = UILabel.newsCellLabel(fontSize: 12,numberOfLines: 1)
    private var headlineLabel = UILabel.newsCellLabel(fontSize: 18)
    private let margin:CGFloat = 10

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(channelView)
        channelView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(margin)
            make.leading.equalToSuperview().offset(margin)
            make.trailing.lessThanOrEqualToSuperview().offset(-margin)
        }

        channelView.addSubview(channelLabel)
        channelLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(margin, 0, 0, 0))
        }

        contentView.addSubview(headlineLabel)
        headlineLabel.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(channelView.snp.bottom).offset(margin)
            make.leading.equalToSuperview().offset(margin)
            make.trailing.equalToSuperview().offset(-margin)
            make.bottom.equalToSuperview().offset(-margin)
        }


    }

    override func layoutSubviews() {
        super.layoutSubviews()
        channelView.addTopBorder(color: UIColor.white, height: 2)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        channelLabel.text = nil
        headlineLabel.text = nil
    }

    func setCell(channel: String?, headline: String?) {
        channelLabel.text = channel
        headlineLabel.text = headline
    }

}
