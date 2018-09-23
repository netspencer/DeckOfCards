//
//  Coordinator.swift
//  CardSort
//
//  Created by Spencer Schoeben on 9/23/18.
//  Copyright © 2018 Magma Media Corp. All rights reserved.
//

import UIKit

final class Coordinator {
    let window: UIWindow
    let navigationController: UINavigationController

    init() {
        let cardListVC = CardListViewController()
        self.navigationController = UINavigationController(rootViewController: cardListVC)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.rootViewController = self.navigationController

        cardListVC.delegate = self
    }

}

extension Coordinator: CardListViewControllerDelegate {

    func didSelect(card: Card) {
        debugPrint("selected \(card)")
    }

}
