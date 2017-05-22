//
//  ViewController.swift
//  InitiumTest
//
//  Created by SuVincent on 29/3/2017.
//  Copyright © 2017 SuVincent. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
}

class RootViewController: UIViewController {

    private let fixedLength: CGFloat = 300
    let screenSize = UIScreen.main.bounds.size

    var rightBarButton: UIBarButtonItem?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
//        print("1")
        rightBarButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(RootViewController.onClickRightNavButton(_:)))
        self.navigationItem.setRightBarButton(rightBarButton, animated: true)

        let leftBarButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(RootViewController.onClickLeftNavButton(_:)))
        navigationItem.setLeftBarButton(leftBarButton, animated: true)


    }

    func onClickRightNavButton(_ sender: UIButton) {

        let popVC = UIViewController()
        popVC.view.backgroundColor = UIColor.yellow
        popVC.preferredContentSize = CGSize(width: fixedLength, height: fixedLength)
        popVC.modalPresentationStyle = .popover
        self.present(popVC, animated: true, completion: nil)

        let popOverVc = popVC.popoverPresentationController
        popOverVc?.permittedArrowDirections = .any
        popOverVc?.delegate = self
        popOverVc?.barButtonItem = rightBarButton

    }

    func onClickLeftNavButton(_ sender: UIButton) {
        guard let url = URL(string: "https://d3jl5c1btygfur.cloudfront.net/media/image/2016/07/c73ec39f740c4b039a5146cb1cdbba49.jpg?imageView2/1/w/1080/h/720/format/jpg") else {
            return
        }

        let barHeight = self.navigationController?.navigationBar.frame.size.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let imageView = UIImageView(frame: CGRect(x: 0 , y: ((barHeight ?? 0) + statusBarHeight), width: fixedLength, height: fixedLength))
        imageView.downloadedFrom(url: url)
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0

        self.view.addSubview(imageView)

        UIView.animate(withDuration: 3, animations: {
            imageView.alpha = 1
        })
    }
}

extension RootViewController: UIPopoverPresentationControllerDelegate {
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("did miss popover")
    }
}

