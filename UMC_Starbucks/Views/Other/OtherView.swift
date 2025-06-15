//
//  OtherView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/20/25.
//

import SwiftUI

enum menuBox: String, CaseIterable {
    case star, receipt, my
    
    var menuTitle: String {
        switch self {
        case .star:
            return "별 히스토리"
        case .receipt:
            return "전자영수증"
        case .my:
            return "나만의 메뉴"
        }
    }
    
    var menuImage: String {
        switch self {
        case .star:
            return "menu.star"
        case .receipt:
            return "menu.receipt"
        case .my:
            return "menu.my"
        }
    }
}

struct OtherView: View {
    
    @AppStorage("nickName") private var nickName: String = "(작성한 닉네임)"
    
    
    enum menuBox: String, CaseIterable {
        case star, receipt, my
        
        var menuTitle: String {
            switch self {
            case .star:
                return "별 히스토리"
            case .receipt:
                return "전자영수증"
            case .my:
                return "나만의 메뉴"
            }
        }
        
        var menuImage: String {
            switch self {
            case .star:
                return "menu.star"
            case .receipt:
                return "menu.receipt"
            case .my:
                return "menu.my"
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            topView
            
            VStack {
                customerInfoView
                
                Spacer()
                
                payView
                
                Spacer()
                
                customerSupportView
            }
            .padding(.vertical, 41)
            .background(Color.white01)
        }
        
    }
    
    private var topView: some View {
        HStack {
            Text("Other")
                .font(.mainTextBold24)
            Spacer()
            Button(action: {
                print("로그아웃")
            }, label: {
                Image(.logOut)
            })
        }
        .padding(.horizontal, 23.5)
        .padding(.bottom, 16)
    }
    
    private var customerInfoView: some View {
        VStack(spacing: 24) {
            VStack(spacing: 5) {
                HStack {
                    Text(nickName)
                        .foregroundStyle(Color.green01)
                    Text("님")
                }
                Text("환영합니다!🙌🏻")
            }
            .font(.mainTextSemibold24)
            
            HStack(spacing: 10.5) {
                ForEach(menuBox.allCases, id: \.self) { menu in
                    MenuBoxView(title: menu.menuTitle, image: menu.menuImage)
                }
            }
            .padding(.horizontal, 24)
        }
        .padding(.leading, 36)
        .padding(.trailing, 29)
    }
    
    
    /// 페이뷰입니다.
    public var payView: some View {
        VStack(alignment: .leading) {
            Text("Pay")
                .font(.mainTextSemiBold18)
                .padding(.bottom, 8)
            HStack {
                MenuCardView(title: "스타벅스 카드 등록", image: "pay.pay")
                
                Spacer()
                
                MenuCardView(title: "카드 교환권 등록", image: "pay.card")
            }
            .padding(.vertical, 16)
            HStack {
                MenuCardView(title: "쿠폰 등록", image: "pay.coupon")
                
                Spacer()
                
                MenuCardView(title: "쿠폰 히스토리", image: "pay.couponHistory")
            }
            .padding(.vertical, 16)
            Divider()
                .frame(width: 327, alignment: .leading)
        }
        .padding(.horizontal, 10)
    }
    
    private var customerSupportView: some View {
        VStack(alignment: .leading) {
            Text("고객지원")
                .font(.mainTextSemiBold18)
                .padding(.bottom, 8)
            // ----
            Group {
                HStack {
                    MenuCardView(title: "스토어 케어", image: "customerSupport.store")
                    
                    Spacer()
                    
                    MenuCardView(title: "고객의 소리", image: "customerSupport.voice")
                }
                
                HStack {
                    MenuCardView(title: "매장 정보", image: "customerSupport.place")
                    
                    Spacer()
                    
                    MenuCardView(title: "반납기 정보", image: "customerSupport.recycle")
                }
                
                HStack {
                    MenuCardView(title: "마이 스타벅스 리뷰", image: "customerSupport.review")
                }
            }
            .padding(.vertical, 16)
            
            // ------
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    OtherView()
}
