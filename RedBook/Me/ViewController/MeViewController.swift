//
//  MeViewController.swift
//  RedBook
//
//  Created by apple on 2022/12/16.
//

import UIKit

class MeViewController: UIViewController {
    
    let pageViewHeight = UIScreen.main.bounds.size.height - 58.0

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    // MARK: - ui
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.tableHeaderView = headerView
        
        headerView.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 58.0)
    }
    
    // MARK: - view
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        return tableView
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.5)
        return view
    }()
    
    private lazy var pageView: YPageView = {
        let pageView = YPageView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: pageViewHeight))
        pageView.isScrollEnable = false
        return pageView
    }()

}

// MARK: - UITableViewDataSource
extension MeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.contentView.subviews.forEach {
            $0.removeFromSuperview()
        }
        cell.addSubview(pageView)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return pageViewHeight
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 58.0 {
            pageView.isScrollEnable = true
        } else {
            pageView.isScrollEnable = false
        }
    }
}

extension MeViewController: YNavigationControllerStyleProtocol {
    var isNavigationBarHidden: Bool {
        return true
    }
}
