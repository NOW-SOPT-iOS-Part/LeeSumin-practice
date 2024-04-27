//
//  ItemModel.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/20/24.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
    
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .item1, name: "에어팟 프로", price: "200,000", heartIsSelected: false),
            ItemModel(itemImg: .item2, name: "명품 향수", price: "250,000", heartIsSelected: false),
            ItemModel(itemImg: .item3, name: "샌드위치", price: "8000", heartIsSelected: false),
            ItemModel(itemImg: .item4, name: "아이폰 13프로맥스", price: "1,000,000", heartIsSelected: false),
            ItemModel(itemImg: .item5, name: "커피머신", price: "100,000", heartIsSelected: false),
            ItemModel(itemImg: .item1, name: "에어팟 프로", price: "200,000", heartIsSelected: false),
            ItemModel(itemImg: .item2, name: "명품 향수", price: "250,000", heartIsSelected: false),
            ItemModel(itemImg: .item3, name: "샌드위치", price: "8000", heartIsSelected: false),
            ItemModel(itemImg: .item4, name: "아이폰 13프로맥스", price: "1,000,000", heartIsSelected: false),
            ItemModel(itemImg: .item5, name: "커피머신", price: "100,000", heartIsSelected: false)
            
        ]
    }
}
