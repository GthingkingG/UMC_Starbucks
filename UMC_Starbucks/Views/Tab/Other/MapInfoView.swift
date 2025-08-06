//
//  MapInfoView.swift
//  UMC_Starbucks
//
//  Created by Air on 7/3/25.
//

import SwiftUI
import MapKit

struct MapInfoView: View {
    @State private var viewModel = MapViewModel()
    @State private var mapSelected: Bool = true
    @State private var currentLocation: String = ""
    @State private var destination: String = ""
    
    @Bindable private var locationManager = LocationManager.shared
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack(spacing: 0) {
                    Button(action: {
                        withAnimation() {
                            mapSelected = true
                        }
                    }, label: {
                        ZStack {
                            Text("매장 찾기")
                        }
                        .frame(width: geometry.size.width / 2)
                    })
                    
                    Button(action: {
                        withAnimation() {
                            mapSelected = false
                        }
                    }, label: {
                        ZStack {
                            Text("길찾기")
                        }
                        .frame(width: geometry.size.width / 2)
                    })
                    
                }
                .font(.mainTextSemibold24)
                .foregroundStyle(Color.black03)
                
                Capsule()
                    .frame(width: 120, height: 5)
                    .foregroundStyle(Color.brown02)
                    .offset(x: mapSelected ? -geometry.size.width * 0.26 : geometry.size.width * 0.26)
                    .padding(.bottom, 19)
                
                if mapSelected {
                    Map(position: $viewModel.cameraPosition)
                } else {
                    findLoadView
                }
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("매장 찾기")
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading, content: {
                Button(action: {
                    print("뒤로가기")
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black03)
                })
            })
        })
    }
    
    private var findLoadView: some View {
        VStack(spacing: 18) {
            VStack(spacing: 13) {
                HStack(spacing: 8) {
                    Text("출발")
                        .font(.mainTextSemibold16)
                        .padding(.trailing, 7)
                    Button(action: {
                        print("현재위치 텍스트 필드에 입력")
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundStyle(Color.brown01)
                                .frame(width: 58, height: 30)
                            Text("현재위치")
                                .font(.mainTextSemiBold13)
                                .foregroundStyle(Color.white01)
                        }
                    })
                    TextField("출발지 입력", text: $currentLocation)
                    Button(action: {
                        print("출발지 리스트 검색")
                    }, label: {
                        Image(.magniferIcon)
                    })
                }
                HStack(spacing: 8) {
                    Text("도착")
                        .font(.mainTextSemibold16)
                        .padding(.trailing, 7)
                    TextField("매장명 또는 주소", text: $destination)
                    Button(action: {
                        print("도착지 리스트 검색")
                    }, label: {
                        Image(.magniferIcon)
                    })
                }
            }
            .textFieldStyle(SquareTextfieldStyle())
            
            Button(action: {
                print("리스트 띄우기")
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 38)
                        .foregroundStyle(Color.green00)
                    Text("경로찾기")
                        .font(.mainTextMedium16)
                        .foregroundStyle(Color.white01)
                }
            })
        }
        .padding(.top, 28)
        .padding(.horizontal, 32)
    }
}

#Preview {
    MapInfoView()
}
