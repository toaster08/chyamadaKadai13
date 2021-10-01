//
//  ViewController.swift
//  chyamadaKadai13
//
//  Created by 山田　天星 on 2021/09/28.
//

import UIKit

struct FruitsModel {
    var name: String = ""
    var isChecked: Bool = false
}

final class ItemListViewController: UIViewController, UITableViewDelegate {
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(ItemListTableViewCell.NibName,
                               forCellReuseIdentifier: ItemListTableViewCell.NibId)
        }
    }

    private var fruitsList: [FruitsModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        fruitsList = [FruitsModel.init(name: "りんご", isChecked: false),
                      FruitsModel.init(name: "みかん", isChecked: true),
                      FruitsModel.init(name: "バナナ", isChecked: false),
                      FruitsModel.init(name: "パイナップル", isChecked: true)
        ]
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruitsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.NibId, for: indexPath)
                as? ItemListTableViewCell else {
            fatalError("The dequeued cell is not instance")
        }
        let fruits = fruitsList[indexPath.row]
        cell.configure(fruits: fruits)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        fruitsList[indexPath.row].isChecked = fruitsList[indexPath.row].isChecked  ? false:true
        tableView.reloadData()
    }
}
