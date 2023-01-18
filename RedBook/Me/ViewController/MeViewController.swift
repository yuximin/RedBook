//
//  MeViewController.swift
//  RedBook
//
//  Created by apple on 2022/12/16.
//

import UIKit

class MeViewController: UIViewController {
    
    let pageViewHeight = UIScreen.main.bounds.size.height - 58.0
    
    private let items: [String] = ["orange", "apple", "strawberry", "Mango", "Banana"]
    
    private var pageSegmentItems: [YPageSegmentItem] = []
    
    private var pageViews: [YPageView.PageView] = []

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createPageView()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pageView.frame = view.bounds
    }
    
    // MARK: - ui
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(pageView)
        view.addSubview(pageControl)
        view.addSubview(pageSegmentView)
    }
    
    private func createPageView() {
        var pageSegmentItems: [YPageSegmentItem] = []
        var pageViews: [YPageView.PageView] = []
        for item in items {
            let pageItemView = YPageItemView()
            pageItemView.title = item
            pageItemView.backgroundColor = .gray
            pageViews.append(pageItemView)
            
            var pageSegmentItem = YPageSegmentItem(title: item)
            pageSegmentItem.calcItemWidth(with: .systemFont(ofSize: 12.0))
            pageSegmentItems.append(pageSegmentItem)
        }
        self.pageViews = pageViews
        self.pageSegmentItems = pageSegmentItems
    }
    
    // MARK: - view
    
    private lazy var pageView: YPageView = {
        let pageView = YPageView()
        pageView.delegate = self
        return pageView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: 0.0, y: 80.0, width: 200, height: 50))
        pageControl.numberOfPages = pageViews.count
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    private lazy var pageSegmentView: YPageSegmentView = {
        let segmentView = YPageSegmentView(items: pageSegmentItems)
        segmentView.frame = CGRect(x: 30.0, y: 200.0, width: 200, height: 50)
        return segmentView
    }()

}

// MARK: - YPageViewDelegate
extension MeViewController: YPageViewDelegate {
    
    func numberOfPageView() -> Int {
        pageViews.count
    }
    
    func pageViewForIndex(_ index: Int) -> YPageView.PageView {
        pageViews[index]
    }
    
    func pageView(_ view: YPageView, didSelected index: Int) {
        pageControl.currentPage = index
    }
    
}

// MARK: - YNavigationControllerStyleProtocol
extension MeViewController: YNavigationControllerStyleProtocol {
    var isNavigationBarHidden: Bool {
        return true
    }
}
