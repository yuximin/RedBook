//
//  HomeRecommendCell.swift
//  RedBook
//
//  Created by apple on 2022/11/11.
//

import UIKit

class HomeRecommendCell: UICollectionViewCell {
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ui
    
    private func setupUI() {
        backgroundColor = .gray
    }
}
