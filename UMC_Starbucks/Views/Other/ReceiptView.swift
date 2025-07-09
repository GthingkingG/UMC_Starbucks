//
//  ReceiptView.swift
//  UMC_Starbucks
//
//  Created by Air on 6/23/25.
//

import SwiftUI
import PhotosUI
import SwiftData

struct ReceiptView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Query(sort: \ReceiptModel.createdAt, order: .reverse) private var receipts: [ReceiptModel]
    
    @State private var selectedItems: [PhotosPickerItem] = []
    
    @State private var showCamera = false
    @State private var showActionSheet = false
    @State private var showPhotosPicker = false
    @State private var showReceipt = false
    
    @State private var totalSum: Int = 0
    
    @State private var selectedReceipt: ReceiptModel?
    
    
    private var receiptViewModel: ReceiptViewModel = .init()
    
    var body: some View {
        ZStack {
            VStack {
                navigationView
                
                VStack {
                    topInfoView
                    
                    receiptListView
                    
                    Spacer()
                }
                .background(Color.white01)
                
            }
            
            if showReceipt {
                if let receipt = selectedReceipt {
                    receiptView(receipt: receipt)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .confirmationDialog("영수증을 어떻게 추가할까요?", isPresented: $showActionSheet, titleVisibility: .visible) {
            Button("앨범에서 가져오기") {
                showPhotosPicker = true
            }
            Button("카메라로 촬영하기") {
                showCamera = true
            }
            Button("취소", role: .cancel) {}
        }
        .sheet(isPresented: $showCamera) {
            CameraPicker { image in
                receiptViewModel.addImage(image)
            }
        }
        .photosPicker(isPresented: $showPhotosPicker, selection: $selectedItems, maxSelectionCount: 1, matching: .images)
        .onChange(of: selectedItems) { oldItems, newItems in
            for item in newItems {
                Task {
                    if let data = try? await
                        item.loadTransferable(type: Data.self), let image = UIImage(data: data) {
                        receiptViewModel.addImage(image)
                        if let currentReceipt = receiptViewModel.currentReceipt {
                            addReceipt(currentReceipt: currentReceipt)
                            calculateTotalSum()
                        }
                    }
                }
            }
        }
        .task {
            calculateTotalSum()
        }
    }
    
    private var navigationView: some View {
        ZStack {
            Text("전자영수증")
                .font(.mainTextMedium16)
                .foregroundStyle(Color.black03)
                .frame(maxWidth: .infinity, alignment: .center)
            
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black03)
                })
                
                Spacer()
                
                Button(action: {
                    showActionSheet = true
                }, label: {
                    Image(systemName: "plus")
                        .foregroundStyle(Color.black03)
                })
            }
        }

        .padding(.horizontal, 13)
        .padding(.bottom, 22)
    }
    
    private var topInfoView: some View {
        
        HStack {
            HStack(spacing: 4) {
                Text("총")
                    .foregroundStyle(Color.black03)
                    .font(.mainTextRegular18)
                Text("\(receipts.count)건")
                    .foregroundStyle(Color.brown01)
                    .font(.mainTextSemiBold18)
            }
            Spacer()
            HStack(spacing: 4) {
                Text("사용합계")
                    .foregroundStyle(Color.black03)
                    .font(.mainTextRegular18)
                Text("\(totalSum)")
                    .foregroundStyle(Color.brown01)
                    .font(.mainTextSemiBold18)
            }
        }
        .padding(.horizontal, 19)
        .padding(.vertical, 16)
    }
    
    private var receiptListView: some View {
        ScrollView {
            ForEach(receipts, id: \.self) { receipt in
                HStack {
                    VStack(alignment: .leading, spacing: 9) {
                        Text(receipt.store)
                            .font(.mainTextSemiBold18)
                            .foregroundStyle(Color.black03)
                        Text(receipt.date)
                            .font(.mainTextMedium16)
                            .foregroundStyle(Color.gray03)
                        Text("\(receipt.totalAmount)원")
                            .font(.mainTextSemiBold18)
                            .foregroundStyle(Color.brown02)
                    }
                    Spacer()
                    
                    Button(action: {
                        print(receipt.store)
                        showReceipt = true
                        selectedReceipt = receipt
                    }, label: {
                        Image(.receiptSignal)
                    })
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 19)
                
            }
            
            Divider()
                .overlay(Color.gray01)
                .padding(.horizontal, 19)
        }
    }
    
    private func addReceipt(currentReceipt: ReceiptModel) {
        let receipt = currentReceipt
        context.insert(receipt)
        try? context.save()
    }
    
    private func deleteReceipt(deleteReceipt: ReceiptModel) {
        context.delete(deleteReceipt)
        try? context.save()
    }
    
    private func calculateTotalSum() {
        totalSum = 0
        for receipt in receipts {
            totalSum += receipt.totalAmount
        }
    }
    
    private func receiptView(receipt: ReceiptModel) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.black03.opacity(0.8))
                .ignoresSafeArea()
            
            if let imageData = receipt.image {
                ZStack(alignment: .topTrailing) {
                    Image(uiImage: (UIImage(data: imageData)!))
                        .resizable()
                        .scaledToFit()
                    
                    Button(action: {
                        showReceipt = false
                    }, label: {
                        Image(.vector)
                            .resizable()
                            .frame(width: 18, height: 18)
                    })
                    .padding(.trailing, 16)
                    .padding(.top, 26)
                }
            }
        }
    }
}

#Preview {
    ReceiptView()
}
