//
//  HomeView.swift
//  UMC_Starbucks
//
//  Created by Air on 5/28/25.
//

import SwiftUI

struct HomeView: View {
    private var homeViewModel: HomeViewModel = .init()
    private var newViewModel: NewViewModel = .init()
    private var dessertViewModel: DessertViewModel = .init()

    @State private var path = NavigationPath()
    
    @AppStorage("nickName") private var nickName: String = "(설정닉네임)"
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                TopView
                Spacer()
                VStack(spacing: 20) {
                    Image(.commercial)
                    
                    RecommandView

                    Image(.eventBanner)
                    
                    Image(.serviceSuscibe)
                    
                    NewView
                    
                    BannerGroupView
                    
                    DessertView
                    
                    Image(.coldBrew)
                    
                    Image(.favorites)
                    
                    Image(.membership)
                }
                .safeAreaPadding(.horizontal, 10)
                
            }
            .ignoresSafeArea()
            .navigationDestination(for: String.self) { _ in 
                PopupView()
            }
        }
        .task {
            path.append("Pop")
        }
    }
    // MARK: - TopViewCode
    
    private var TopView: some View {
        ZStack(alignment: .bottom) {
            Image("topImage")
                .padding(.top, 14)
                .padding(.bottom, 19)
            VStack(alignment: .leading, spacing: 0) {
                Text("골든 미모사 그린티와 함께\n행복한 새해의 축배를 들어요!")
                    .font(.mainTextBold24)
                    .baselineOffset(8)
                    .padding(.bottom, 9)
                
                HStack(spacing: 4) {
                    Spacer()
                    
                    Text("내용보기")
                        .foregroundStyle(Color.gray06)
                        .font(.mainTextRegular13)
                    Image("topIconGoLine")
                }
                .padding(.trailing, 24)
                
                RewardView
            }
            .padding(.leading, 28)
            .padding(.trailing, 11)
            
        }
        .frame(height: 259)
    }
    
    private var RewardView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("11★ until next Reward")
                    .foregroundStyle(Color.brown02)
                    .font(.mainTextSemibold16)
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundStyle(Color(red: 0.86, green: 0.86, blue: 0.86))
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundStyle(Color.brown01)
                        .frame(width: 110)
                }
                
            }
            .frame(maxWidth: 255)
            .padding(.bottom, 3)
            
            Spacer()
            
            HStack(spacing: 5) {
                Text("1")
                    .font(.mainTextSemiBold38)
                Text("/")
                    .font(.pretend(type: .light, size: 24))
                    .foregroundStyle(Color(red: 0.79, green: 0.79, blue: 0.79))
                Text("12★")
                    .foregroundStyle(.brown02)
                    .font(.mainTextSemibold24)
            }
            .padding(.trailing, 30)
            
        }
        .frame(height: 38)
    }
    
    //MARK: - MiddleContents
    
    private var RecommandView: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 0) {
                Text(nickName)
                    .foregroundStyle(Color.brown01)
                Text("님을 위한 추천 메뉴")
            }
            .font(.mainTextBold24)
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(homeViewModel.homeModels, id: \.self) { item in
                        Button(action: {
                            path.append(item)
                            print(item.title)
                        }, label: {
                            VStack(spacing: 10) {
                                CircleImageCard(title: item.title, image: item.image)
                            }
                        })
                        .navigationDestination(for: HomeModel.self) { value in
                            CoffeeDetailView(item: value)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, 10)
    }
    
    private var NewView: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text("What's New")
                .font(.mainTextBold24)
                .foregroundStyle(Color.black03)
            ScrollView(.horizontal) {
                HStack(spacing: 16, content: {
                    ForEach(newViewModel.newModels, id: \.self) { item in
                        NewCard(title: item.title, desription: item.description, image: item.image)
                    }
                })
            }
            .scrollIndicators(.hidden)
            
        })
    }
    
    private var BannerGroupView: some View {
        VStack(spacing: 0, content: {
            Image(.mugCupBanner)
            ZStack(alignment: .leading) {
                Image(.onlineBanner)
                VStack(alignment: .leading, spacing: 4) {
                    Text("TIP")
                        .font(.mainTextSemiBold12)
                        .foregroundStyle(Color(red: 0.71, green: 0.71, blue: 0.71))
                    Text("온라인 스토어\n별★ 적립 혜택")
                        .lineSpacing(10)
                        .font(.mainTextBold24)
                        .foregroundStyle(Color.black03)
                        .padding(.bottom, 12)
                    Text("온라인 스토어 구매 시\n별★을 적립해 드립니다.")
                        .lineSpacing(6)
                        .font(.mainTextBold16)
                        .foregroundStyle(Color(red: 0.71, green: 0.71, blue: 0.71))
                }
                .padding(.leading, 20)
            }
            ZStack(alignment: .leading) {
                Image(.deliveryBanner)
                VStack(alignment: .leading, spacing: 16) {
                    Text("딜리버스\n예약 배달 서비스")
                        .lineSpacing(6)
                        .font(.mainTextBold22)
                        .foregroundStyle(Color(red: 0, green: 0.38, blue: 0.25))
                    Text("특별한 순간을 위해\n미리 예약해 보세요.")
                        .lineSpacing(10)
                        .font(.mainTextBold16)
                        .foregroundStyle(Color.black02)
                }
                .padding(.leading, 24)
            }
        })
    }
    
    //MARK: - BottomContents
    
    private var DessertView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("하루가 달콤해지는 디저트")
                .font(.mainTextSemibold24)
                .foregroundStyle(.black03)
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(dessertViewModel.dessertModels, id: \.self) { item in
                        VStack(spacing: 10) {
                            CircleImageCard(title: item.title, image: item.image)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }

}

#Preview {
    HomeView()
}
