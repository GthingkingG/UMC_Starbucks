//
//  ProductViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 6/20/25.
//

import Foundation

@Observable
class ProductViewModel {
    let allProductModels: [ProductModel] = AllProductLists.lists
    let firstBestItems: [ProductModel] = ItemDataList.firstItems
    let secondBestItems: [ProductModel] = ItemDataList.secondItems
    let newProductModels: [ProductModel] = NewProductLists.lists
}
