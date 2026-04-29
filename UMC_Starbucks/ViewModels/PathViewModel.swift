//
//  PathViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 8/7/25.
//

import Foundation
import Moya

@Observable
class PathViewModel {
    var pathData: PathData?
    var listData: ListData?
    let provider: MoyaProvider<UserRouter>
    var departureLocation: String?
    
    var currentPaht: PathData?
    
    init() {
//        self.provider = MoyaProvider<UserRouter>()
        let logger = NetworkLoggerPlugin(configuration: .init(logOptions: [.verbose]))
        self.provider = MoyaProvider<UserRouter>(plugins: [logger])
    }
    
    func getRouteData(departure: String, arrival: String) {
        provider.request(.getRoute(departure: departure, arrival: arrival), completion: { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(PathData.self, from: response.data)
                    self?.pathData = decodedData
                } catch {
                    print("경로 데이터 디코더 오류", error)
                }
            case .failure(let error):
                print("error", error)
            }
        })
    }
    
    func getListData(query: String) {
        provider.request(.getList(query: query), completion: { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(ListData.self, from: response.data)
                    self?.listData = decodedData
                } catch {
                    print("응답 데이터 디코더 오류", error)
                }
            case .failure(let error):
                print("error", error)
            }
        })
    }
}
