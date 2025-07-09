//
//  PageControl.swift
//  UMC_Starbucks
//
//  Created by Air on 6/20/25.
//

import SwiftUI

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { pagingIndex in
                let isCurrentPage = currentPage == pagingIndex
                let height = 8.0
                let width = height
                
                Circle()
                    .fill(isCurrentPage ? Color.black03 : Color.white01)
                    .stroke(isCurrentPage ? Color.black03 : Color.black01, style: StrokeStyle(lineWidth: 1))
                    .frame(width: width, height: height)
            }
        }
    }
}
