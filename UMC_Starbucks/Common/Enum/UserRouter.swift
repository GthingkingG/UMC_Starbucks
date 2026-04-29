//
//  UserRouter.swift
//  UMC_Starbucks
//
//  Created by Air on 8/7/25.
//

import Foundation
import Moya

enum UserRouter {
    case getRoute(departure: String, arrival: String)
    case getList(query: String)
}

extension UserRouter: APITargetType {
    var baseURL: URL{
        switch self {
        case .getRoute:
            return URL(string: "http://localhost:8080")!
        case .getList:
            return URL(string: "https://dapi.kakao.com")!
        }
    }
    
    var path: String {
        switch self {
        case .getRoute(let departure, let arrival):
            return "/route/v1/foot/\(departure);\(arrival)"
        case .getList:
            return "/v2/local/search/keyword.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getRoute:
            return .requestParameters(parameters: ["geometries": "geojson"], encoding: URLEncoding.queryString)
        case .getList(let query):
            return .requestParameters(parameters: ["query": query], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch task {
        case .requestParameters:
            return ["Authorization": "KakaoAK f01db281cbc11084bcd4f04e85f58dc3", "Content-Type": "application/json"]
        default:
            return nil
        }
    }
    
}
