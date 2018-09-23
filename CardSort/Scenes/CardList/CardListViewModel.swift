//
//  CardListViewModel.swift
//  CardSort
//
//  Created by Spencer Schoeben on 9/23/18.
//  Copyright © 2018 Magma Media Corp. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources
import Moya
import RxMoya

final class CardListViewModel {

    private let disposeBag = DisposeBag()

    let api = MoyaProvider<DeckOfCards>()

    let deck = BehaviorRelay<Deck>(value: Deck())
    let cards = BehaviorRelay<[Card]>(value: [])

    init() {
        self.bindDeck()
    }

    /// gets a new shuffled deck
    func getNewShuffledDeck() {
        self.api.rx.request(.newDeck)
            .map(Deck.self)
            .catchErrorJustReturn(Deck())
            .asObservable()
            .bind(to: self.deck)
            .disposed(by: self.disposeBag)
    }

    private func bindDeck() {
        self.deck.filter { $0.success }
            .map({ [unowned self] (deck) -> Single<Response> in
                return self.api.rx.request(.drawFromDeck(deckID: deck.deck_id, count: 52))
            })
            .switchLatest()
            .map(Array<Card>.self)
            .bind { (deck) in
                debugPrint("GOT DECK", deck)
            }
            .disposed(by: self.disposeBag)
    }

}
