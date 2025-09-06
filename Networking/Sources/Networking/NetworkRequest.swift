//
//  NetworkRequest.swift
//  Networking
//
//  Created by Ameya on 06/09/25.
//

import Foundation

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public struct NetworkRequest {
    public let path: String
    public let httpMethod: HTTPMethod
    public let httpBody: Data?
    public let queryItems: [URLQueryItem]?
    public let httpHeaders: [String: String]?
    
    public init(
        path: String,
        httpMethod: HTTPMethod,
        httpBody: Data? = nil,
        queryItems: [URLQueryItem]? = nil,
        httpHeaders: [String: String]? = nil
    ) {
        self.path = path
        self.httpMethod = httpMethod
        self.httpBody = httpBody
        self.queryItems = queryItems
        self.httpHeaders = httpHeaders
    }
}
