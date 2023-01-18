//
//  YPageSegmentItem.swift
//  RedBook
//
//  Created by apple on 2023/1/18.
//

import Foundation
import UIKit

struct YPageSegmentItem {
    var title: String
    
    var itemWidth: CGFloat = 0.0
    
    mutating func calcItemWidth(with font: UIFont) {
        let rect = title.boundingRect(with: CGSize(width: CGFloat.infinity, height: CGFloat.infinity), options: [], attributes: [.font: font], context: nil)
        print("whaley log -- \(title) \(rect)")
        self.itemWidth = rect.size.width
    }
}
