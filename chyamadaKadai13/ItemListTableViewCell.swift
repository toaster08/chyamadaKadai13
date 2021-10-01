//
//  TableViewCell.swift
//  chyamadaKadai13
//
//  Created by 山田　天星 on 2021/09/28.
//

import UIKit

final class ItemListTableViewCell: UITableViewCell {
    static let NibName = UINib(nibName: "TableViewCell", bundle: nil)
    static let NibId = "Cell"

    @IBOutlet private weak var checkImageView: UIImageView!
    @IBOutlet private weak var itemNameLabel: UILabel!

    func configure(fruits: FruitsModel) {
        itemNameLabel.text = fruits.name

        switch fruits.isChecked {
        case  true: checkImageView.image = UIImage.init(systemName: "checkmark")
        case false: checkImageView.image = nil
        }
    }
}
