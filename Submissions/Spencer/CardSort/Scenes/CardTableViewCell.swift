//
//  CardTableViewCell.swift
//  CardSort
//
//  Created by Spencer Schoeben on 9/23/18.
//  Copyright © 2018 Magma Media Corp. All rights reserved.
//

import UIKit
import Nuke

class CardTableViewCell: UITableViewCell {

    // MARK: Model

    var model: Card? {
        didSet {
            guard let m = model else { return }
            self.textLabel?.text = m.description
            if let imageUrl = URL(string: m.image), let imageView = self.imageView {
                loadImage(with: imageUrl, into: imageView)
            }
        }
    }

    // MARK: Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }

}

extension CardTableViewCell {

    // MARK: Setup

    private func setup() {
        
    }

}
