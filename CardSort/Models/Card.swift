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
    let image: Data

    public init(rank: Rank, suit: Suit, image: Data) {
        self.rank = rank
        self.suit = suit
        self.image = image
    }
}

// MARK: - Codable
extension Card: Codable {

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
