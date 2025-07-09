//
//  MapInfoView.swift
//  UMC_Starbucks
//
//  Created by Air on 7/3/25.
//

import SwiftUI
import MapKit

struct MapInfoView: View {
    @Binding var path: NavigationPath
    @State private var mapSelected: Bool = true
    
    @Bindable private var locationManager = LocationManager.shared
    @Bindable private var viewModel: MapViewModel = .init()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
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
                
                Map(position: $viewModel.cameraPosition)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("매장 찾기")
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading, content: {
                Button(action: {
                    path.removeLast()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black03)
                        .frame(width: 24, height: 24)
                })
            })
        })
    }
}

