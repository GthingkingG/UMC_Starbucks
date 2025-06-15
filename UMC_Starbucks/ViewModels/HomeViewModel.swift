//
//  HomeViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 5/28/25.
//

import Foundation

@Observable
class HomeViewModel {
    let homeModels: [HomeModel] = [
        .init(title: "에스프레소 콘 파나", image: "conpanna", englishTitle: "Espresson Con Panna", backgroundImage: "conpaannaBack", description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료", value: "4,100", drinkType: .hotOnly),
        .init(title: "에스프레소 마끼아또", image: "macchiato", englishTitle: "Espresso Macchiato", backgroundImage: "macchiatoBack", description: "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료", value: "3,900", drinkType: .icedOnly),
        .init(title: "아이스 카페 아메리카노", image: "iceAmericano", englishTitle: "Iced Caffe Americano", backgroundImage: "iceAmericanoBack", description: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피", value: "4,700", drinkType: .bothIced),
        .init(title: "카페 아메리카노", image: "cafeAmericano", englishTitle: "Caffe Americano", backgroundImage: "cafeAmericanoBack", description: "진한 에스프레소와 뜨거운 물을 섞어 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피", value: "4,700", drinkType: .bothHot),
        .init(title: "아이스 카라멜 마끼아또", image: "iceCaramel", englishTitle: "Iced Caramel Macchiato", backgroundImage: "iceCaramelBack", description: "향긋한 바닐라 시럽과 시원한 우유에 얼음을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료", value: "6,100", drinkType: .bothIced),
        .init(title: "카라멜 마끼아또", image: "caramel", englishTitle: "Caramel Macchiato", backgroundImage: "caramelBack", description: "향긋한 바닐라 시럽과 따듯한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료", value: "6,100", drinkType: .bothHot)
    ]
    
}
