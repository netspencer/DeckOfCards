//
//  Suit.swift
//  CardSort
//
//  Created by Spencer Schoeben on 9/22/18.
//  Copyright © 2018 Magma Media Corp. All rights reserved.
//

import Foundation

public enum Suit: String {
    case spades, hearts, diamonds, clubs
}

// MARK: - Comparable
extension Suit: Comparable {
    public static func <(lhs: Suit, rhs: Suit) -> Bool {
        switch (lhs, rhs) {
        case (_, _) where lhs == rhs:
            return false
        case (.spades, _),
             (.hearts, .diamonds), (.hearts, .clubs),
             (.diamonds, .clubs):
            return false
        default:
            return true
        }
    }
}

// MARK: - CustomStringConvertible
extension Suit: CustomStringConvertible {
    public var description: String {
        switch self {
        case .spades: return "♠︎"
        case .hearts: return "♡"
        case .diamonds: return "♢"
        case .clubs: return "♣︎"
        }
    }
}
