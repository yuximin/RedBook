//
//  YPageSegmentView.swift
//  RedBook
//
//  Created by apple on 2023/1/17.
//

import UIKit

class YPageSegmentView: UIView {
    
    var items: [YPageSegmentItem]
    
    var spacing: CGFloat = 10.0
    
    /// 默认选中
    var defaultSelectedIndex: Int = 0
    
    /// 当前选中
    var currentSelectedIndex: Int = 0
    
    // MARK: - life cycle
    
    init(items: [YPageSegmentItem]) {
        self.items = items
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.frame = self.bounds
    }
    
    // MARK: - ui
    
    private func setupUI() {
        addSubview(collectionView)
    }
    
    // MARK: - view
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(YPageSegmentBaseCell.self, forCellWithReuseIdentifier: "YPageSegmentBaseCell")
        return collectionView
    }()

}

// MARK: - interface
extension YPageSegmentView {
    public func setSelectedIndex() {
        
    }
}

// MARK: - UICollectionViewDataSource
extension YPageSegmentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YPageSegmentBaseCell", for: indexPath)
        if let segmentCell = cell as? YPageSegmentBaseCell {
            segmentCell.title = items[indexPath.item].title
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension YPageSegmentView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension YPageSegmentView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: items[indexPath.item].itemWidth + YPageSegmentBaseCell.leftInset + YPageSegmentBaseCell.rightInset, height: 30.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        self.spacing
    }
}
