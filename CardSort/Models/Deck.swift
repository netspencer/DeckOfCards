//
//  Deck.swift
//  CardSort
//
//  Created by Spencer Schoeben on 9/23/18.
//  Copyright © 2018 Magma Media Corp. All rights reserved.
//

import Foundation

struct Deck: Codable {
    var remaining: Int = 0
    var deck_id: String = ""
    var success: Bool = false
    var shuffled: Bool = false
    var cards: [Card] = []

    enum CodingKeys: String, CodingKey {
        case remaining, deck_id, success, shuffled
    }
}
