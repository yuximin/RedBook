//
//  HomeRecommendViewController.swift
//  RedBook
//
//  Created by apple on 2022/11/11.
//

import UIKit

class HomeRecommendViewController: UIViewController {
    
    // MARK: - view
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (kScreenWidth - 5.0) / 2.0 - 1.0, height: 180.0)
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 5.0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(HomeRecommendCell.self, forCellWithReuseIdentifier: "HomeRecommendCell")
        return collectionView
    }()

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - ui
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = "Recommend"
        
        view.addSubview(collectionView)
        collectionView.frame = CGRect(x: 0.0, y: 0.0, width: kScreenWidth, height: kScreenHeight)
    }

}

// MARK: - YNavigationControllerStyleProtocol
extension HomeRecommendViewController: YNavigationControllerStyleProtocol {
    var isNavigationBarHidden: Bool {
        true
    }
}

// MARK: - UICollectionViewDataSource
extension HomeRecommendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeRecommendCell", for: indexPath)
        return cell
    }
}
