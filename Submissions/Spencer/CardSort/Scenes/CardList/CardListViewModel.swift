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

    var cards: Observable<[Card]> {
        return self.deck.asObservable()
            .map({ deck in
                deck.cards.sorted()
            })
    }

    var sectionedDeck: Observable<[CardSectionModel]> {
        return self.cards.map({ cards in
            return cards.reduce([CardSectionModel](), { (sections, card) -> [CardSectionModel] in
                if let index = sections.firstIndex(where: { $0.model == card.suit.description }) {
                    var updatedSection = sections[index]
                    updatedSection.items.append(card)
                    var updatedSections = sections
                    updatedSections[index] = updatedSection
                    return updatedSections
                } else {
                    var updatedSections = sections
                    updatedSections.append(CardSectionModel(model: card.suit.description, items: [card]))
                    return updatedSections
                }
            })
        })
    }

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
        self.deck.filter { $0.success && $0.remaining > 0 }
            .map({ [unowned self] (deck) -> Single<Response> in
                return self.api.rx.request(.drawFromDeck(deckID: deck.deck_id,
                                                         count: deck.remaining))
            })
            .switchLatest()
            .mapJSON()
            .map({data -> [Card] in
                let json = data as! [String: Any]
                let cards = json["cards"] as! [[String: Any]]
                return cards.compactMap({ (card) -> Card? in
                    return Card.fromAPI(card)
                })
            })
            .bind { [unowned self] (cards) in
                var deck = self.deck.value
                deck.remaining = 0
                deck.cards = cards
                self.deck.accept(deck)
            }
            .disposed(by: self.disposeBag)
    }

}
