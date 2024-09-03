//
//  ApiService.swift
//  CryptoRepoPackage
//
//  Created by Marcelo Mogrovejo on 02/12/2023.
//

import Foundation

public protocol ApiServiceProtocol {

    /// Fetch a list of coins with their market data.
    ///
    /// - Returns: an array of coins with their market data.
    /// - throws: An error.
    ///
    func getCoinsWithMarkets() async throws -> [DomainCoin]
}

public struct ApiService {

    public let remoteRepository: RemoteCryptoRepository

    public init(remoteRepository: RemoteCryptoRepository = RemoteCryptoRepository()) {
        self.remoteRepository = remoteRepository
    }

}

extension ApiService: ApiServiceProtocol {

    public func getCoinsWithMarkets() async throws -> [DomainCoin] {
        do {
            let coinDtos = try await remoteRepository.list()
            return coinDtos.map{ coinDto in
                DomainCoin(id: coinDto.id,
                           symbol: coinDto.symbol,
                           name: coinDto.name,
                           image: coinDto.image,
                           currentPrice: coinDto.currentPrice,
                           priceChange24H: coinDto.priceChange24H,
                           priceChangePercentage24H: coinDto.priceChangePercentage24H,
                           marketCapRank: coinDto.marketCapRank)
            }
        } catch {
            throw error
        }
    }

}
