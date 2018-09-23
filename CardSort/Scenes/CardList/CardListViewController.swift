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
import Moya
import RxMoya

protocol CardListViewControllerDelegate: class {
    func didSelect(card: Card)
}

class CardListViewController: UITableViewController {

    let disposeBag = DisposeBag()

    weak var delegate: CardListViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup()
    }

}

extension CardListViewController {

    private func setup() {
        self.navigationItem.title = "Deck of Cards"

        let api = MoyaProvider<DeckOfCards>()
        api.rx.request(.newDeck)
            .subscribe(onSuccess: { response in
                debugPrint(response.data)
            }) { (error) in
                debugPrint("error: \(error)")
            }
            .disposed(by: self.disposeBag)
    }

}
