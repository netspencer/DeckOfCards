//
//  CardListViewController+DataSource.swift
//  CardSort
//
//  Created by Spencer Schoeben on 9/23/18.
//  Copyright © 2018 Magma Media Corp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

typealias CardSectionModel = SectionModel<String, Card>

extension CardListViewController {

    func dataSource() -> RxTableViewSectionedReloadDataSource<CardSectionModel> {
        return RxTableViewSectionedReloadDataSource<CardSectionModel>(
            configureCell: { (_, tv, idx, card) -> UITableViewCell in
                let cell: CardTableViewCell = tv.dequeueReusableCell(withIdentifier: "cardCell", for: idx) as! CardTableViewCell

                cell.model = card

                return cell
        },
            titleForHeaderInSection: { (ds, idx) -> String? in
                return ds[idx].model
        })
    }

}
