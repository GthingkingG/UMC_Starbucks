//
//  DessertModel.swift
//  UMC_Starbucks
//
//  Created by Air on 5/29/25.
//

import Foundation

struct DessertModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var image: String
}

final class DessertModelList {
    static let lists: [DessertModel] = [
        .init(title: "너티 크루아상", image: "nutty"),
        .init(title: "매콤 소시지 불고기", image: "spicy"),
        .init(title: "미니 리프 파이", image: "leaf"),
        .init(title: "빵 오 쇼콜라", image: "bbaeng"),
        .init(title: "소시지&올리브 파이", image: "pie")
    ]
}
