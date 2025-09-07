//
//  LocationAPIConfig.swift
//  AppEndpoints
//
//  Created by Ameya on 06/09/25.
//

import Foundation
import AppConstants
import Networking

public enum LocationAPIConfig: APIConfig {
    case geocode(location: String)
    
    public func path() -> String {
        "/geo/1.0/direct"
    }
    
    public func httpMethod() -> Networking.HTTPMethod {
        .GET
    }
    
    public func queryItems() -> [URLQueryItem]? {
        var queryItems: [URLQueryItem] = []
        
        switch self {
        case let .geocode(location):
            queryItems.append(URLQueryItem(name: CommonQueryItemKeys.query.rawValue, value: location))
            queryItems.append(URLQueryItem(name: CommonQueryItemKeys.apiKey.rawValue, value: AppConstants.apiKey))
        }
        
        return queryItems
    }
    
    public func httpBody() -> Data? {
        return nil
    }
    
    public func httpHeaders() -> [String: String]? {
        return nil
    }
}
