//
//  YPageView.swift
//  RedBook
//
//  Created by apple on 2022/12/16.
//

import UIKit

protocol YPageViewProtocol {
    var contentView: UIView { get }
}

class YPageControl {
    var items: [String] = []
}

protocol YPageViewDelegate: AnyObject {
    func numberOfPageView() -> Int
    func pageViewForIndex(_ index: Int) -> YPageView.PageView
    func pageView(_ view: YPageView, didSelected index: Int)
}

class YPageView: UIView {
    
    typealias PageView = (UIView & YPageViewProtocol)
    
    weak var delegate: YPageViewDelegate?
    
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
        
        collectionView.frame = bounds
    }
    
    // MARK: - ui
    
    private func setupUI() {
        backgroundColor = .clear
        
        addSubview(collectionView)
    }
    
    // MARK: - view
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        return collectionView
    }()

}

// MARK: - UICollectionViewDataSource
extension YPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        delegate?.numberOfPageView() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        if let itemView = delegate?.pageViewForIndex(indexPath.item) {
            cell.contentView.addSubview(itemView)
            itemView.frame = cell.contentView.bounds
        }
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension YPageView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("YPageView collectionView willDisplay \(indexPath)")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("YPageView scrollView didEndDecelerating")
        let offset = scrollView.contentOffset.x
        let page = Int(offset) / Int(collectionView.frame.size.width)
        delegate?.pageView(self, didSelected: page)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension YPageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }
}
