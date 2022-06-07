//
//  AppFullscreenHeaderCell.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 03/06/2022.
//

import UIKit


class AppFullscreenHeaderCell: UITableViewCell {
    
    let todayCell = TodayCell()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        addSubview(todayCell)
        todayCell.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
