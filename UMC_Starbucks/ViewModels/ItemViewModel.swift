//
//  ItemViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 6/20/25.
//

import Foundation

@Observable
class ItemViewModel {
    let firstItemModels: [ItemModel] = FirstItemDataList.items
    
    let secondItemModels: [ItemModel] = SecondItemDataList.items
}
