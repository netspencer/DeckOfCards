//
//  DeckOfCardsAPI.swift
//  CardSort
//
//  Created by Spencer Schoeben on 9/23/18.
//  Copyright © 2018 Magma Media Corp. All rights reserved.
//

import Foundation
import Moya

public enum DeckOfCards {
    case newDeck
    case drawFromDeck(deckID: String, count: Int)
}

extension DeckOfCards: TargetType {
    public var baseURL: URL {
        return URL(string: "https://deckofcardsapi.com/api")!
    }

    public var path: String {
        switch self {
        case .newDeck:
            return "/deck/new/shuffle/?deck_count=1"
        case let .drawFromDeck(deckID, count):
            return "/deck/\(deckID)/draw/?count=\(count)"
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }

    public var task: Task {
        return .requestPlain
    }

    public var headers: [String : String]? {
        return nil
    }
}
