//
//  YPageItemView.swift
//  RedBook
//
//  Created by apple on 2023/1/17.
//

import UIKit

class YPageItemView: UIView {
    
    var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
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
        
        titleLabel.frame = self.bounds
    }
    
    // MARK: - ui
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(titleLabel)
    }

    // MARK: - view
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14.0)
        label.textAlignment = .center
        return label
    }()
}

extension YPageItemView: YPageViewProtocol {
    var contentView: UIView {
        self
    }
}
