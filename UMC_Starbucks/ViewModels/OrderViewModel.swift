//
//  OrderViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 6/30/25.
//

import Foundation

@Observable
class OrderViewModel {
    let orderMenues: [OrderModel] = [
        OrderModel(title: "추천", description: "Recommended", isRecommended: true, image: "recommendOrder"),
        OrderModel(title: "아이스 카페 아메리카노", description: "Reserve Espresso", isRecommended: true, image: "reserveEspressoOrder"),
        OrderModel(title: "카페 아메리카노", description: "Reserve Drip", isRecommended: true, image: "reserveDripOrder"),
        OrderModel(title: "카푸치노", description: "Dcaf Coffee", isRecommended: false, image: "dcafCoffeeOrder"),
        OrderModel(title: "아이스 카푸치노", description: "Espresso", isRecommended: true, image: "espressoOrder"),
        OrderModel(title: "카라멜 마끼아또", description: "Blonde Coffee", isRecommended: true, image: "blondeCoffeeOrder"),
        OrderModel(title: "아이스 카라멜 마끼아또", description: "Cold Berw", isRecommended: true, image: "coldBrewOrder"),
        OrderModel(title: "아포가토/기타", description: "Others", isRecommended: false, image: "othersOrder"),
        OrderModel(title: "럼 샷 코르타도", description: "Brewed Coffee", isRecommended: true, image: "brewedCoffeeOrder"),
        OrderModel(title: "라벤터 카페 브레베", description: "Teavana", isRecommended: true, image: "teavanaOrder"),
        OrderModel(title: "병음료", description: "RTD", isRecommended: false, image: "rtdOrder")
    ]
}
