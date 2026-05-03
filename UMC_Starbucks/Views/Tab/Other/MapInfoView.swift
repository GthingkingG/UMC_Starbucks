//
//  MapInfoView.swift
//  UMC_Starbucks
//
//  Created by Air on 7/3/25.
//

import SwiftUI
import CoreLocation
import MapKit

struct MapInfoView: View {
    @State private var viewModel = MapViewModel()
    @State private var mapSelected: Bool = true
    @State private var currentLocation: String = ""
    @State private var destination: String = ""
    @State var pathViewModel = PathViewModel()
    
    private var orderSheetViewModel: OrderSheetViewModel = .init()
    
    @Bindable private var locationManager = LocationManager.shared
    
    let geocoder = CLGeocoder()
    
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
        .toolbarVisibility(.hidden)
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
                        inputCurrentLocation()
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
                        pathViewModel.getListData(query: currentLocation)
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
                        orderSheetViewModel.loadData { result in
                            switch result {
                            case .success(_):
                                print("성공")
                            case .failure(let error):
                                print("error: \(error)")
                            }
                        }
                        orderSheetViewModel.filterData(keyword: destination)
                    }, label: {
                        Image(.magniferIcon)
                    })
                }
            }
            .textFieldStyle(SquareTextfieldStyle())
            
            Button(action: {
                Task {
                    do {
                        let placemarks = try await geocoder.geocodeAddressString(pathViewModel.departureLocation ?? "")
                        if let location = placemarks.first?.location {
                            print("위도: \(location.coordinate.latitude), 경도: \(location.coordinate.longitude)")
                            pathViewModel.currentPaht?.departure = "\(location.coordinate.latitude),\(location.coordinate.longitude)"
                        }
                    } catch {
                        print("지오코딩 에러1: \(error.localizedDescription)")
                    }
                    
                    do {
                        let placemarks = try await geocoder.geocodeAddressString(orderSheetViewModel.arrivalLocation ?? "")
                        if let location = placemarks.first?.location {
                            print("위도: \(location.coordinate.latitude), 경도: \(location.coordinate.longitude)")
                            pathViewModel.currentPaht?.arrival = "\(location.coordinate.latitude),\(location.coordinate.longitude)"
                        }
                    } catch {
                        print("지오코딩 에러2: \(error.localizedDescription)")
                    }
                }
                if let path = pathViewModel.currentPaht {
                    pathViewModel.getRouteData(departure: path.departure, arrival: path.arrival)
                }
                
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
            
            depatureListView
            
            arrivalListView
            
        }
        .padding(.top, 28)
        .padding(.horizontal, 32)
    }
    
    private var depatureListView: some View {
        VStack {
            if let data = pathViewModel.listData {
                ScrollView {
                    ForEach(data.documents, id: \.self) { item in
                        HStack {
                            Button(action: {
                                currentLocation = item.place
                                pathViewModel.departureLocation = item.address
                                print(pathViewModel.departureLocation ?? "오류")
                                pathViewModel.listData = nil
                            }, label: {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(item.place)
                                        .font(.mainTextMedium16)
                                        .foregroundStyle(Color.black03)
                                    Text(item.address)
                                        .font(.mainTextMedium13)
                                        .foregroundStyle(Color.gray04)
                                }
                            })
                            Spacer()
                        }
                        Divider()
                    }
                }
            }
        }
    }
    
    private var arrivalListView: some View {
        VStack {
            if orderSheetViewModel.list.count != 0 {
                ScrollView {
                    ForEach(orderSheetViewModel.list, id: \.self) { item in
                        HStack {
                            Button(action: {
                                destination = item.properties.storeName
                                orderSheetViewModel.arrivalLocation = item.properties.address
                                orderSheetViewModel.list.removeAll()
                            }, label: {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(item.properties.storeName)
                                        .font(.mainTextMedium16)
                                        .foregroundStyle(Color.black03)
                                    Text(item.properties.address)
                                        .font(.mainTextMedium13)
                                        .foregroundStyle(Color.gray04)
                                }
                            })
                            Spacer()
                        }
                        Divider()
                    }
                }
            }
        }
    }
    
    func inputCurrentLocation() {
        Task {
            guard let location = locationManager.currentLocation else {
                print("현재 위치 오류")
                return
            }
            
            do {
                let placemarks = try await geocoder.reverseGeocodeLocation(location)
                if let placemark = placemarks.first {
                    let address = [
                        placemark.administrativeArea,
                        placemark.locality,
                        placemark.subLocality,
                        placemark.subThoroughfare
                    ].compactMap { $0 }.joined(separator: " ")
                    
                    currentLocation = address
                }
            } catch {
                print("역지오코딩 에러: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    MapInfoView()
}
