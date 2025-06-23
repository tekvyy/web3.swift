//
//  web3.swift
//  Copyright © 2022 Argent Labs Limited. All rights reserved.
//

import BigInt
import Foundation

public enum CallResolution {
    case noOffchain(failOnExecutionError: Bool)
    case offchainAllowed(maxRedirects: Int)
}

//  MARK: EthereumClient (HTTP or Websocket)

public protocol EthereumClientProtocol: EthereumRPCProtocol, AnyObject {
    // Legacy result-based API
    func net_version(completionHandler: @escaping (Result<EthereumNetwork, EthereumClientError>) -> Void)
    func eth_gasPrice(completionHandler: @escaping (Result<BigUInt, EthereumClientError>) -> Void)
    func eth_blockNumber(completionHandler: @escaping (Result<Int, EthereumClientError>) -> Void)
    func eth_getBalance(address: EthereumAddress, block: EthereumBlock, completionHandler: @escaping (Result<BigUInt, EthereumClientError>) -> Void)
    func eth_getCode(address: EthereumAddress, block: EthereumBlock, completionHandler: @escaping (Result<String, EthereumClientError>) -> Void)
    func eth_estimateGas(_ transaction: EthereumTransaction, completionHandler: @escaping (Result<BigUInt, EthereumClientError>) -> Void)
    func eth_sendRawTransaction(_ transaction: EthereumTransaction, withAccount account: EthereumAccountProtocol, completionHandler: @escaping (Result<String, EthereumClientError>) -> Void)
    func eth_getTransactionCount(address: EthereumAddress, block: EthereumBlock, completionHandler: @escaping (Result<Int, EthereumClientError>) -> Void)
    func eth_getTransaction(byHash txHash: String, completionHandler: @escaping (Result<EthereumTransaction, EthereumClientError>) -> Void)
    func eth_getTransactionReceipt(txHash: String, completionHandler: @escaping (Result<EthereumTransactionReceipt, EthereumClientError>) -> Void)
    func eth_call(
        _ transaction: EthereumTransaction,
        block: EthereumBlock,
        completionHandler: @escaping (Result<String, EthereumClientError>) -> Void
    )
    func eth_call(
        _ transaction: EthereumTransaction,
        resolution: CallResolution,
        block: EthereumBlock,
        completionHandler: @escaping (Result<String, EthereumClientError>) -> Void
    )
    func eth_getLogs(addresses: [EthereumAddress]?, topics: [String?]?, fromBlock: EthereumBlock, toBlock: EthereumBlock, completionHandler: @escaping (Result<[EthereumLog], EthereumClientError>) -> Void)
    func eth_getLogs(addresses: [EthereumAddress]?, orTopics: [[String]?]?, fromBlock: EthereumBlock, toBlock: EthereumBlock, completionHandler: @escaping (Result<[EthereumLog], EthereumClientError>) -> Void)
    func eth_getBlockByNumber(_ block: EthereumBlock, completionHandler: @escaping (Result<EthereumBlockInfo, EthereumClientError>) -> Void)
    func getLogs(addresses: [EthereumAddress]?, topics: Topics?, fromBlock: EthereumBlock, toBlock: EthereumBlock) async throws -> [EthereumLog]
}

