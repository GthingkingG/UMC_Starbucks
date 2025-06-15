//
//  HomeModel.swift
//  UMC_Starbucks
//
//  Created by Air on 5/28/25.
//

import Foundation

struct HomeModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var image: String
    
    var englishTitle: String
    var backgroundImage: String
    var description: String
    var value: String
    var drinkType: DrinkType
}

enum DrinkType {
    case bothHot
    case bothIced
    case hotOnly
    case icedOnly
}
