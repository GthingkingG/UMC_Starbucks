//
//  ShopView.swift
//  UMC_Starbucks
//
//  Created by Air on 6/20/25.
//

import SwiftUI

struct ShopView: View {
    let columns = Array(repeating: GridItem(.flexible(), spacing: 65), count: 2)
    private var productViewModel: ProductViewModel = .init()
    
    @State var selection = 0
    
    var body: some View {
        ScrollView {
            VStack {
                titleView
                Spacer()
                productsView
                Spacer()
                itemView
                Spacer()
                newProductsView
                
            }
            .padding(.horizontal, 16)
        }
        .background(Color.white01)
    }
    
    private var titleView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Starbucks Online Store")
                .foregroundStyle(Color.black03)
                .font(.mainTextBold24)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 28) {
                    Image(.dayShop)
                    Image(.travelShop)
                    Image(.loveShop)
                }
            }
        }
    }
    
    private var productsView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("All Products")
                .foregroundStyle(Color.black03)
                .font(.mainTextSemiBold18)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 17) {
                    ForEach(productViewModel.allProductModels, id: \.id) { product in
                        CircleImageCard(title: product.title, image: product.image)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private var itemView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Best Items")
                .foregroundStyle(Color.black03)
                .font(.mainTextSemiBold18)
            TabView(selection: $selection) {
                LazyVGrid(columns: columns, spacing: 54) {
                    ForEach(productViewModel.firstBestItems, id: \.id) { item in
                        ItemCard(title: item.title, image: item.image)
                    }
                }
                .tag(0)
                
                LazyVGrid(columns: columns) {
                    ForEach(productViewModel.secondBestItems, id: \.self) { item in
                        ItemCard(title: item.title, image: item.image)
                    }
                }
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack {
                Spacer()
                PageControl(numberOfPages: 2, currentPage: $selection)
                Spacer()
            }
        }
        .frame(height: 520) /*프레임을 주지 않으면 뷰 크기가 매우 작아진다.*/
    }
    
    private var newProductsView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("New Products")
                .foregroundStyle(Color.black03)
                .font(.mainTextSemiBold18)
            LazyVGrid(columns: columns) {
                ForEach(productViewModel.newProductModels, id: \.id) { product in
                    ItemCard(title: product.title, image: product.image)
                }
            }
        }
    }
}

#Preview {
    ShopView()
}
