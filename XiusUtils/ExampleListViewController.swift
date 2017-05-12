//
//  ExampleListViewController.swift
//  XiusUtils
//
//  Created by Alexius Lim Li Liang on 09/05/2017.
//  Copyright © 2017 Xius. All rights reserved.
//

import UIKit
import Cartography

class ExampleListViewController: UIViewController {
    private var tableView:UITableView!
    fileprivate var exampleList = ["Keyboard Util", "Date Formatter"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        assignConstraints()
    }
    
    func configureView() {
        tableView = UITableView(frame: .zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExampleCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
    }
    
    func assignConstraints() {
        constrain(self.tableView) { tableView in
            guard let superview = tableView.superview else { return }
            tableView.edges == inset(superview.edges, 0)
        }
    }
}

extension ExampleListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCell", for: indexPath)
        cell.textLabel?.text = exampleList[indexPath.row]
        return cell
    }
}

extension ExampleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let keyboardUtilVC = KeyboardUtilViewController()
            self.navigationController?.pushViewController(keyboardUtilVC, animated: true)
        case 1:
            let dateFormatterVC = DateFormatterViewController()
            self.navigationController?.pushViewController(dateFormatterVC, animated: true)
        default:
            break
        }
    }
}
