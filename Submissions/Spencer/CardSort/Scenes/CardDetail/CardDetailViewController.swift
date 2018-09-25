//
//  CardDetailViewController.swift
//  CardSort
//
//  Created by Spencer Schoeben on 9/23/18.
//  Copyright © 2018 Magma Media Corp. All rights reserved.
//

import UIKit
import Nuke
import RxSwift
import RxCocoa
import Cartography

class CardDetailViewController: UIViewController {

    private let disposeBag = DisposeBag()

    let viewModel = CardDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.bind()
    }

    private let imageView = UIImageView()

}

extension CardDetailViewController {

    private func setup() {
        view.addSubview(imageView)
        constrain(imageView) { (imageView) in
            imageView.edges == imageView.superview!.edges
        }
    }

    private func bind() {
        viewModel.card
            .bind { [unowned self] card in
                guard let c = card else { return }
                loadImage(with: URL(string: c.image)!, into: self.imageView)
            }
            .disposed(by: self.disposeBag)
    }

}
