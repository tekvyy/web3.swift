//
//  web3.swift
//  Copyright © 2022 Argent Labs Limited. All rights reserved.
//

import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

public protocol NetworkProviderProtocol {
    var session: URLSession { get }
    func send<P: Encodable, U: Decodable>(method: String, params: P, receive: U.Type) async throws -> Any
}
