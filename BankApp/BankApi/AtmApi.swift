//
//  AtmApi.swift
//  ATMinfo
//
//  Created by Hleb Rastsisheuski on 12.01.23.
//

import Foundation
import Moya
 
enum AtmApi {
    case getAtms(city: String? = nil)
    case getFilials(city: String? = nil)
    case getBriliant
    case getMetall
}

extension AtmApi: TargetType {
    var baseURL: URL {
        switch self {
            case .getAtms:       return URL(string: "https://belarusbank.by/api/")!
            case .getFilials:    return URL(string: "https://belarusbank.by/api/")!
            case .getBriliant:   return URL(string: "https://belarusbank.by/api/")!
            case .getMetall:    return URL(string: "https://belarusbank.by/api/")!
        }
    }
    
    var path: String {
        switch self {
            case .getAtms:          return "atm"
            case .getFilials:       return "filials_info"
            case .getBriliant:      return "getgems"
            case .getMetall:        return "getinfodrall"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String: Any]? {
        var params = [String: Any]()
        switch self {
            case .getAtms(city: let city):
                params["city"] = city
            case .getFilials(city: let city):
                params["city"] = city
            case .getBriliant:
                return nil
            case .getMetall:
                return nil
        }
        return params
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
    var task: Moya.Task {
        guard let parameters else { return .requestPlain }
        return .requestParameters(parameters: parameters, encoding: encoding)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var requestDescription: String {
        switch self {
            case .getAtms:
                return "getAtms"
            case .getFilials:
                return "getFilials"
            case .getBriliant:
                return "getBriliant"
            case .getMetall:
                return "getMetall"
        }
    }
}

