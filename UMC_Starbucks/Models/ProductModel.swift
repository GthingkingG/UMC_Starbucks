//
//  ProductModel.swift
//  UMC_Starbucks
//
//  Created by Air on 6/20/25.
//

import Foundation

struct ProductModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var image: String
}

final class AllProductLists {
    static let lists: [ProductModel] = [
        ProductModel(title: "텀블러", image: "tumbler"),
        ProductModel(title: "커피용품", image: "coffeeSupplies"),
        ProductModel(title: "선물세트", image: "giftSet"),
        ProductModel(title: "보온병", image: "thermos"),
        ProductModel(title: "머그/컵", image: "mugCup"),
        ProductModel(title: "라이프스타일", image: "lifeStyle")
    ]
}

final class ItemDataList {
    static let firstItems: [ProductModel] = [
        ProductModel(title: "그린 사이렌 슬리브 머그 \n335ml", image: "sleeve"),
        ProductModel(title: "그린 사이렌 클래식 머그 \n335ml", image: "classic"),
        ProductModel(title: "사이렌 머그 앤 우드 소서", image: "wood"),
        ProductModel(title: "리저브 골드 테일 머그 \n355ml", image: "tail")
    ]
    
    static let secondItems: [ProductModel] = [
        ProductModel(title: "블랙 앤 골드 머그 473ml", image: "blackAndGold"),
        ProductModel(title: "블랙 링 머그 355ml", image: "blackRing"),
        ProductModel(title: "북청사자놀음 데미머그 \n89ml", image: "demiMug"),
        ProductModel(title: "서울 제주 데미머그 세트", image: "demiMugSet")
    ]
}

final class NewProductLists {
    static let lists: [ProductModel] = [
        ProductModel(title: "그린 사이렌 도트 머그 \n237ml", image: "dotMug"),
        ProductModel(title: "그린 사이렌 도트 머그 \n355ml", image: "dotMug355"),
        ProductModel(title: "홈 카페 미니 머그 세트", image: "mugSet"),
        ProductModel(title: "홈 카페 글라스 세트", image: "glassSet")
    ]
}

