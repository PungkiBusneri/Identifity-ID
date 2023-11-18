//
//  NetworkServiceAPI.swift
//  SwiftyJSONTest
//
//  Created by Pungki Busneri on 01/11/23.
//

import Moya


enum NetworkAPIService {
    case getUsers
}

extension NetworkAPIService: TargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com/")!
    }

    var path: String {
        switch self {
        case .getUsers:
            return "users"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getUsers:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .getUsers:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return [
            "Content-Type": "application/json"
        ]
    }
}
