//
//  YPageView.swift
//  RedBook
//
//  Created by apple on 2022/12/16.
//

import UIKit

class YPageView: UIView {
    
    var isScrollEnable: Bool = false {
        didSet {
            tableView.isScrollEnabled = isScrollEnable
        }
    }
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableView.frame = bounds
    }
    
    // MARK: - ui
    
    private func setupUI() {
        backgroundColor = .clear
        
        addSubview(tableView)
    }
    
    // MARK: - view
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        return tableView
    }()

}

// MARK: - UITableViewDataSource
extension YPageView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = .red.withAlphaComponent(0.5)
        } else {
            cell.contentView.backgroundColor = .lightGray
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension YPageView: UITableViewDelegate {
    
}
