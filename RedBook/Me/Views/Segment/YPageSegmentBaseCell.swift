//
//  YPageSegmentBaseCell.swift
//  RedBook
//
//  Created by apple on 2023/1/17.
//

import UIKit

class YPageSegmentBaseCell: UICollectionViewCell {
    
    var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    static let leftInset: CGFloat = 10.0
    static let rightInset: CGFloat = 10.0
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2.0
        layer.masksToBounds = true
        
        titleLabel.frame = CGRect(x: Self.leftInset, y: 0.0, width: self.bounds.width - Self.leftInset - Self.rightInset, height: self.bounds.height)
    }
    
    // MARK: - ui
    
    private func setupUI() {
        backgroundColor = .white
        
        contentView.addSubview(titleLabel)
    }
    
    // MARK: - view
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0)
        label.textColor = .black
        return label
    }()
}
