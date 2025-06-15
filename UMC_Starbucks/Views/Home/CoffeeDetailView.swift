//
//  CoffeeDetailView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/29/25.
//

import SwiftUI

struct CoffeeDetailView: View {
    var item: HomeModel
    @State var isIced: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            Image(item.backgroundImage)
                .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 4, content: {
                    HStack(spacing: 4, content: {
                        Text(item.title)
                            .font(.mainTextSemibold24)
                            .foregroundStyle(Color.black03)
                        Image(.new)
                    })
                    Text(item.englishTitle)
                        .font(.mainTextSemiBold14)
                        .foregroundStyle(Color.gray01)
                })
                VStack(alignment: .leading, spacing: 20, content: {
                    Text(item.description)
                        .font(.mainTextSemiBold14)
                        .foregroundStyle(Color.gray06)
                    Text("\(item.value)원")
                        .font(.mainTextBold24)
                        .foregroundStyle(Color.black03)
                })
                
                selectTypeView(item: item)
                
            }
            .padding(.horizontal, 10)
            
            Spacer()
            
            Button(action: {
                print("주문하기")
            }, label: {
                ZStack {
                    Capsule()
                        .foregroundStyle(Color.green00)
                    Text("주문하기")
                        .font(.mainTextMedium16)
                        .foregroundStyle(Color.white)
                }
            })
            .padding(.horizontal, 28)
            .padding(.vertical, 15)
            .frame(height: 73)
        }
        .padding(.bottom, 14)
        .ignoresSafeArea()
        .onAppear() {
            selectIced(item: item)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar() {
            ToolbarItem(placement: .principal, content: {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(.backIcon)
                    })
                    Spacer()
                    Button(action: {
                        print("공유")
                    }, label: {
                        Image(.shareIcon)
                    })
                }
            })
        }
    }
    
    func selectIced(item: HomeModel) {
        if item.drinkType == .bothIced {
            isIced = true
        }
    }
    
    @ViewBuilder
    func selectTypeView(item: HomeModel) -> some View {
        switch item.drinkType {
        case .bothHot:
            DrinkTypeView(isIced: $isIced)
        case .bothIced:
            DrinkTypeView(isIced: $isIced)
        case .hotOnly:
            HotOnlyView()
        case .icedOnly:
            IcedOnlyView()
        }
    }
}

#Preview {
    CoffeeDetailView(item: .init(title: "에스프레소 콘 파나", image: "conpanna", englishTitle: "Espresson Con Panna", backgroundImage: "conpaannaBack", description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료", value: "4,100", drinkType: .hotOnly))
}
