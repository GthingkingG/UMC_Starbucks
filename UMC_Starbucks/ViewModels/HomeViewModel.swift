//
//  HomeViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 5/28/25.
//

import Foundation

@Observable
class HomeViewModel {
    let homeModels: [HomeModel] = HomeLists.lists
    let newModels: [NewModel] = NewLists.lists
    let dessertModels: [DessertModel] = DessertModelList.lists
}
