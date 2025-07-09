//
//  OrderView.swift
//  UMC_Starbucks
//
//  Created by Air on 6/30/25.
//

import SwiftUI

struct OrderView: View {
    @State var currentIndex: Int = 0
    @State var currentTab: Int = 0
    @State var showSheet: Bool = false
    
    private var orderViewModel: OrderViewModel = .init()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 6) {
                        topSegmentView
                        
                        bottomSegmentView
                    }
                    Divider()
                        .overlay(Color.gray04)
                    
                    listView
                }
                buttonView
            }
            .navigationTitle("Order")
            .sheet(isPresented: $showSheet, content: {
                VStack(spacing: 24) {
                    Capsule(style: .circular)
                        .fill(Color.gray04)
                        .frame(width: 70, height: 4)
                        .padding(.top, 11)
                    
                    OrderSheetView()
                }
            })
            
        }
    }
    
    private var topSegmentView: some View {
        HStack(spacing: 0) {
            ForEach(TopSegment.allCases, id: \.self) { segment in
                Button(action: {
                    currentIndex = segment.index
                }, label: {
                    if segment.isCake {
                        VStack {
                            HStack(spacing: 4) {
                                Image(.cake)
                                Text(segment.title)
                                    .font(.mainTextBold16)
                                    .foregroundStyle(Color.green01)
                                    .padding(.vertical, 13)
                            }
                            Rectangle()
                                .frame(height: 3)
                                .foregroundStyle(selectedDividerColor(index: currentIndex, segmentIndex: segment.index))
                                .shadow(color: .black03.opacity(0.15), radius: 1.5, x: 0, y: 3)
                        }
                    } else {
                        VStack {
                            Text(segment.title)
                                .font(.mainTextBold16)
                                .foregroundStyle(selectedTextColor(index: currentIndex, segmentIndex: segment.index))
                                .padding(.vertical, 13)
                            Rectangle()
                                .frame(height: 3)
                                .foregroundStyle(selectedDividerColor(index: currentIndex, segmentIndex: segment.index))
                                .shadow(color: .black03.opacity(0.15), radius: 1.5, x: 0, y: 3)
                        }
                    }
                })
            }
        }
    }
    
    private var bottomSegmentView: some View {
        HStack {
            ForEach(BottomSegment.allCases, id: \.self) { type in
                Button(action: {
                    currentTab = type.index
                }, label: {
                    HStack(spacing: 2) {
                        Text(type.title)
                            .font(.mainTextSemibold16)
                            .foregroundStyle(selectedTextColor(index: currentTab, segmentIndex: type.index))
                        Image(.new)
                    }
                    .padding(.horizontal, 6)
                    .padding(.vertical, 18)
                })
            }
        }
        .padding(.horizontal, 23)
    }
    
    private var listView: some View {
        ScrollView {
            LazyVStack(spacing: 26) {
                ForEach(orderViewModel.orderMenues, id: \.self) { item in
                    listCard(item: item)
                }
            }
            .padding(.top, 19)
        }
    }
    
    private var buttonView: some View {
        ZStack {
            Rectangle()
                .fill(Color.black02)
                .frame(height: 60)
            
            VStack(spacing: 7) {
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    HStack {
                        Text("주문할 매장을 선택해 주세요")
                            .font(.mainTextSemibold16)
                            .foregroundStyle(Color.white01)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundStyle(Color.white01)
                    }
                })
                Divider()
                    .overlay(Color.gray06)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }
    
    func selectedTextColor(index: Int, segmentIndex: Int) -> Color {
        return index == segmentIndex ? Color.black03 : Color.gray04
    }
    
    func selectedDividerColor(index: Int, segmentIndex: Int) -> Color {
        return index == segmentIndex ? Color.green01 : Color.gray01
    }
}

#Preview {
    OrderView()
}
