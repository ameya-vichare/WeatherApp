//
//  Endpoint.swift
//  AppEndpoints
//
//  Created by Ameya on 06/09/25.
//

import Foundation

public protocol Endpoint {
    func path() -> String
    func queryItems() -> [URLQueryItem]?
}
