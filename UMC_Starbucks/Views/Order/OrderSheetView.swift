//
//  OrderSheetView.swift
//  UMC_Starbucks
//
//  Created by Air on 7/1/25.
//

import SwiftUI
import MapKit

struct OrderSheetView: View {
    @State private var searchText: String = ""
    @State private var currentIndex: Int = 0
    @State private var showingMap: Bool = false
    
    @Bindable private var locationManager = LocationManager.shared
    @Bindable private var viewModel: MapViewModel = .init()
    
    private var orderSheetViewModel: OrderSheetViewModel = .init()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                TopControllerView
                
                Divider()
                    .overlay(Color.gray07)
                    .padding(.top, 17)
                
                if showingMap { MapView
                } else { ListView
                }
                
            }
            .navigationTitle("매장설정")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                Button(action: {
                    showingMap.toggle()
                }, label: {
                    Image(showingMap ? .listIcon : .mapIcon)
                })
            })
            .task {
                orderSheetViewModel.loadData { result in
                    switch result {
                    case .success(_):
                        print("성공")
                    case .failure(let error):
                        print("error: \(error)")
                    }
                }
            }
        }
        
    }
    
    private var TopControllerView: some View {
        VStack(alignment: .leading, spacing: 22) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray08)
                    .frame(height: 27)
                
                HStack(alignment: .center) {
                    
                    Text("검색")
                        .foregroundStyle(Color.gray01)
                        .font(.mainTextSemiBold12)
                }
                .padding(.leading, 7)
            }
            
            HStack(spacing: 10) {
                Button(action: {
                    currentIndex = 0
                }, label: {
                    Text("가까운 매장")
                        .foregroundStyle(selectedColor(index: 0))
                        .font(selectedFont(index: 0))
                })
                Divider()
                    .overlay(Color.gray02)
                    .frame(height: 12)
                Button(action: {
                    currentIndex = 1
                }, label: {
                    Text("자주 가는 매장")
                        .foregroundStyle(selectedColor(index: 1))
                        .font(selectedFont(index: 1))
                })
            }
        }
        .padding(.horizontal, 32)
    }
    
    private var ListView: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                if let orderSheetModel = orderSheetViewModel.orderSheetModel {
                    ForEach(orderSheetModel.features, id: \.self) { item in
                        locationCard(item: item.properties)
                    }
                }
            }
        }
        .padding(.horizontal, 32)
        .scrollIndicators(.hidden)
    }
    
    private var MapView: some View {
        Map(position: $viewModel.cameraPosition)
    }
    
    func selectedFont(index: Int) -> Font {
        return currentIndex == index ? .mainTextSemiBold13 : .mainTextRegular13
    }
    
    func selectedColor(index: Int) -> Color {
        return currentIndex == index ? .black03 : .gray03
    }
    
}

#Preview {
    OrderSheetView()
}
