//
//  CardListViewController.swift
//  CardSort
//
//  Created by Spencer Schoeben on 9/23/18.
//  Copyright © 2018 Magma Media Corp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol CardListViewControllerDelegate: class {
    func didSelect(card: Card)
}

class CardListViewController: UITableViewController {

    let disposeBag = DisposeBag()

    let viewModel = CardListViewModel()

    weak var delegate: CardListViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup()
        self.bind()
    }

}

extension CardListViewController {

    private func setup() {
        self.navigationItem.title = "Deck of Cards"
    }

    private func bind() {
        viewModel.getNewShuffledDeck()
    }

}
