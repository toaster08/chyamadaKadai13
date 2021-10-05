//
//  ViewController.swift
//  chyamadaKadai13
//
//  Created by 山田　天星 on 2021/09/28.
//

import UIKit

struct Fruit {
    var name: String = ""
    var isChecked: Bool = false
}

final class ItemListViewController: UIViewController, UITableViewDelegate {
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(ItemListTableViewCell.nibName,
                               forCellReuseIdentifier: ItemListTableViewCell.nibID)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    private var fruitsList: [Fruit] = [Fruit(name: "りんご", isChecked: false),
                                       Fruit(name: "みかん", isChecked: true),
                                       Fruit(name: "バナナ", isChecked: false),
                                       Fruit(name: "パイナップル", isChecked: true)
    ]
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruitsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.nibID, for: indexPath)
                as? ItemListTableViewCell else {
            fatalError("The dequeued cell is not instance")
        }
        let fruit = fruitsList[indexPath.row]
        cell.configure(fruit: fruit)
        return cell
    }
}
