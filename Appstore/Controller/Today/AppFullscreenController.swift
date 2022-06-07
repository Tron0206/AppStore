//
//  AppFullscreenController.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 01/06/2022.
//

import UIKit


class AppFullscreenController: UITableViewController {
    
    var todayItem: TodayItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeView)))
        tableView.allowsSelection = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let headerCell = AppFullscreenHeaderCell()
            headerCell.todayCell.todayItem = todayItem
            return headerCell
        }
        
        let cell = AppFullscreeenDescriptionCell()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 450
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    @objc func closeView() {
        dismiss(animated: true)
    }
}
