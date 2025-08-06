//
//  OtherView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/20/25.
//
import SwiftUI


struct OtherView: View {
    @Bindable var router: NavigationRouter
    
    @AppStorage("nickName") private var nickName: String = "(작성한 닉네임)"
    
    let columns = Array(repeating: GridItem(.fixed(157), spacing: 110), count: 2)
    
    let keychain = KeychainService.shared

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
            .padding(.horizontal, 10)
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
        .padding(.horizontal, 23)
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
                Text("환영합니다! 🙌🏻")
            }
            .font(.mainTextSemibold24)
            
            HStack(spacing: 10) {
                ForEach(menuBox.allCases, id: \.self) { menu in
                    Button(action: {
                        print(menu.menuTitle)
                        router.push(menu.menuDestination)
                    }, label: {
                        MenuBoxView(title: menu.menuTitle, image: menu.menuImage)
                    })
                }
            }
            .padding(.horizontal, 24)
        }
    }
    
    public var payView: some View {
        VStack(alignment: .leading) {
            Text("Pay")
                .font(.mainTextSemiBold18)
                .padding(.bottom, 8)
            
//            HStack {
//                MenuCardView(title: "스타벅스 카드 등록", image: "pay.pay")
//                
//                Spacer()
//                
//                MenuCardView(title: "카드 교환권 등록", image: "pay.card")
//            }
//            .padding(.vertical, 16)
//            HStack {
//                MenuCardView(title: "쿠폰 등록", image: "pay.coupon")
//                
//                Spacer()
//                
//                MenuCardView(title: "쿠폰 히스토리", image: "pay.couponHistory")
//            }
//            .padding(.vertical, 16)
            LazyVGrid(columns: columns, alignment: .leading, spacing: 0) {
                MenuCardView(router: router, title: "스타벅스 카드 등록", image: "pay.pay")
                MenuCardView(router: router, title: "스타벅스 카드 등록", image: "pay.pay")
                MenuCardView(router: router, title: "쿠폰 등록", image: "pay.pay")
                MenuCardView(router: router, title: "스타벅스 카드 등록", image: "pay.pay")
            }
            
            Divider()
                .frame(width: 327, alignment: .leading)
        }
    }
    
    private var customerSupportView: some View {
        VStack(alignment: .leading) {
            Text("고객지원")
                .font(.mainTextSemiBold18)
                .padding(.bottom, 8)
            Group {
                HStack {
                    MenuCardView(router: router, title: "스토어 케어", image: "customerSupport.store")
                    
                    Spacer()
                    
                    MenuCardView(router: router, title: "고객의 소리", image: "customerSupport.voice")
                }
                
                HStack {
                    MenuCardView(router: router, title: "매장 정보", image: "customerSupport.place")
                    
                    Spacer()
                    
                    MenuCardView(router: router, title: "반납기 정보", image: "customerSupport.recycle")
                }
                
                HStack {
                    MenuCardView(router: router, title: "마이 스타벅스 리뷰", image: "customerSupport.review")
                }
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    OtherView(router: .init())
}
