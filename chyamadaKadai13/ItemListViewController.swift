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
        }
    }

    private var fruitsList: [Fruit] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        fruitsList = [Fruit.init(name: "りんご", isChecked: false),
                      Fruit.init(name: "みかん", isChecked: true),
                      Fruit.init(name: "バナナ", isChecked: false),
                      Fruit.init(name: "パイナップル", isChecked: true)
        ]
    }
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
