//
//  Card.swift
//  CardSort
//
//  Created by Spencer Schoeben on 9/22/18.
//  Copyright © 2018 Magma Media Corp. All rights reserved.
//

import Foundation

public struct Card {
    let rank: Rank
    let suit: Suit
    let image: String
}

// MARK: - API
extension Card {
    static func fromAPI(_ value: [String: Any]) -> Card? {
        guard
            let image = value["image"] as? String,
            let rank = value["value"] as? String,
            let suit = value["suit"] as? String
            else { return nil }

        return Card(rank: Rank.fromAPI(rank), suit: Suit.fromAPI(suit), image: image)
    }
}

// MARK: - Equatable
extension Card: Equatable {
    public static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank && lhs.suit == rhs.suit
    }
}

// MARK: - Comparable
extension Card: Comparable {
    public static func <(lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank ? lhs.suit < rhs.suit : lhs.rank < rhs.rank
    }
}

// MARK: - CustomStringConvertible
extension Card: CustomStringConvertible {
    public var description: String {
        return "\(suit) \(rank)"
    }
}
