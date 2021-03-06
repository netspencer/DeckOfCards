//
//  Rank.swift
//  CardSort
//
//  Created by Spencer Schoeben on 9/22/18.
//  Copyright © 2018 Magma Media Corp. All rights reserved.
//

import Foundation

public enum Rank: Int {
    case two = 2
    case three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, ace
}

// MARK: - API
extension Rank {
    static func fromAPI(_ value: String) -> Rank {
        switch value {
        case "2":
            return Rank.two
        case "3":
            return Rank.three
        case "4":
            return Rank.four
        case "5":
            return Rank.five
        case "6":
            return Rank.six
        case "7":
            return Rank.seven
        case "8":
            return Rank.eight
        case "9":
            return Rank.nine
        case "10":
            return Rank.ten
        case "JACK":
            return Rank.jack
        case "QUEEN":
            return Rank.queen
        case "KING":
            return Rank.king
        default:
            return Rank.ace
        }
    }
}


// MARK: - Comparable
extension Rank: Comparable {
    public static func <(lhs: Rank, rhs: Rank) -> Bool {
        switch (lhs, rhs) {
        case (_, _) where lhs == rhs:
            return false
        case (.ace, _):
            return false
        default:
            return lhs.rawValue < rhs.rawValue
        }
    }
}

// MARK: - CustomStringConvertible
extension Rank: CustomStringConvertible {
    public var description: String {
        switch self {
        case .ace: return "A"
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        default:
            return "\(rawValue)"
        }
    }
}
