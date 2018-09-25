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
import RxDataSources

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

        self.tableView.register(CardTableViewCell.self, forCellReuseIdentifier: "cardCell")
    }

    private func bind() {
        viewModel.getNewShuffledDeck()

        viewModel.sectionedDeck
            .bind(to: tableView.rx.items(dataSource: self.dataSource()))
            .disposed(by: self.disposeBag)

        tableView.rx.modelSelected(Card.self)
            .asDriver()
            .drive(onNext: { [unowned self] card in
                self.delegate?.didSelect(card: card)
            })
            .disposed(by: self.disposeBag)
    }

}
