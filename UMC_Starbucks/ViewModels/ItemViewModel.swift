//
//  ItemViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 6/20/25.
//

import Foundation

@Observable
class ItemViewModel {
    let firstItemModels: [ItemModel] = [
        ItemModel(title: "그린 사이렌 슬리브 머그 \n335ml", image: "sleeve"),
        ItemModel(title: "그린 사이렌 클래식 머그 \n335ml", image: "classic"),
        ItemModel(title: "사이렌 머그 앤 우드 소서", image: "wood"),
        ItemModel(title: "리저브 골드 테일 머그 \n355ml", image: "tail")
    ]
    
    let secondItemModels: [ItemModel] = [
        ItemModel(title: "블랙 앤 골드 머그 473ml", image: "blackAndGold"),
        ItemModel(title: "블랙 링 머그 355ml", image: "blackRing"),
        ItemModel(title: "북청사자놀음 데미머그 \n89ml", image: "demiMug"),
        ItemModel(title: "서울 제주 데미머그 세트", image: "demiMugSet")
    ]
    
}
