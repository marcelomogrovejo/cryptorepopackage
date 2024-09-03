//
//  ApiServiceTests.swift
//  CryptoRepoPackageTests
//
//  Created by Marcelo Mogrovejo on 02/01/2024.
//

import XCTest
@testable import CryptoRepoPackage

final class ApiServiceTests: XCTestCase {

    private var remoteRepo: RemoteRepositoryMock?

    override func setUpWithError() throws {
        remoteRepo = RemoteRepositoryMock()
    }

    override func tearDownWithError() throws {
        remoteRepo = nil
    }

    func testList_onSuccess() async {
        // Arrange
        remoteRepo?.listSuccess = true
        let returnCoins = getFakeCoinList()
        remoteRepo?.listReturnData = returnCoins

        // Act
        do {
            let coins = try await remoteRepo?.list()
            // Assert
            XCTAssertEqual(remoteRepo?.isListCalled, true)
            XCTAssertEqual(remoteRepo?.numberOfTimesIsCalledList, 1)
            XCTAssertEqual(returnCoins.count, coins?.count)
            if let coins = coins {
                XCTAssertEqual(returnCoins[1].name, coins[1].name)
            }
        } catch {
        }
    }

    func testList_onFailure() async {
        // Arrange
        remoteRepo?.listSuccess = false

        // Act
        do {
            let _ = try await remoteRepo?.list()
        } catch {
            // Assert
            XCTAssertNotNil(error)
        }
    }

}

extension ApiServiceTests {

    // MARK: - Mock data
    private func getFakeCoinList() -> [CoinDto] {
        var coinDtos: [CoinDto] = []
        coinDtos.append(CoinDto(id: "bitcoin",
                               symbol: "btc",
                               name: "Bitcoin",
                               image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                               currentPrice: 87335,
                               marketCap: nil,
                               marketCapRank: nil,
                               fullyDilutedValuation: nil,
                               totalVolume: nil,
                               high24H: nil,
                               low24H: nil,
                               priceChange24H: 2420.27,
                               priceChangePercentage24H: 2.85023,
                               marketCapChange24H: nil,
                               marketCapChangePercentage24H: nil,
                               circulatingSupply: nil,
                               totalSupply: nil,
                               maxSupply: nil,
                               ath: nil,
                               athChangePercentage: nil,
                               athDate: nil,
                               atl: nil,
                               atlChangePercentage: nil,
                               atlDate: nil,
                               lastUpdated: nil,
                               sparklineIn7D: nil,
                               priceChangePercentage24HInCurrency: nil))
        coinDtos.append(CoinDto(id: "ethereum",
                               symbol: "eth",
                               name: "Ethereum",
                               image: "https://coin-images.coingecko.com/coins/images/279/large/ethereum.png?1696501628",
                               currentPrice: 3729.79,
                               marketCap: nil,
                               marketCapRank: nil,
                               fullyDilutedValuation: nil,
                               totalVolume: nil,
                               high24H: nil,
                               low24H: nil,
                               priceChange24H: 128.14,
                               priceChangePercentage24H: 3.55785,
                               marketCapChange24H: nil,
                               marketCapChangePercentage24H: nil,
                               circulatingSupply: nil,
                               totalSupply: nil,
                               maxSupply: nil,
                               ath: nil,
                               athChangePercentage: nil,
                               athDate: nil,
                               atl: nil,
                               atlChangePercentage: nil,
                               atlDate: nil,
                               lastUpdated: nil,
                               sparklineIn7D: nil,
                               priceChangePercentage24HInCurrency: nil))
        coinDtos.append(CoinDto(id: "tether",
                               symbol: "usdt",
                               name: "Tether",
                               image: "https://coin-images.coingecko.com/coins/images/325/large/Tether.png?1696501661",
                               currentPrice: 1.48,
                               marketCap: nil,
                               marketCapRank: nil,
                               fullyDilutedValuation: nil,
                               totalVolume: nil,
                               high24H: nil,
                               low24H: nil,
                               priceChange24H: 0.00705495,
                               priceChangePercentage24H: 0.47838,
                               marketCapChange24H: nil,
                               marketCapChangePercentage24H: nil,
                               circulatingSupply: nil,
                               totalSupply: nil,
                               maxSupply: nil,
                               ath: nil,
                               athChangePercentage: nil,
                               athDate: nil,
                               atl: nil,
                               atlChangePercentage: nil,
                               atlDate: nil,
                               lastUpdated: nil,
                               sparklineIn7D: nil,
                               priceChangePercentage24HInCurrency: nil))
        coinDtos.append(CoinDto(id: "binancecoin",
                               symbol: "bnb",
                               name: "BNB",
                               image: "https://coin-images.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1696501970",
                               currentPrice: 789.07,
                               marketCap: nil,
                               marketCapRank: nil,
                               fullyDilutedValuation: nil,
                               totalVolume: nil,
                               high24H: nil,
                               low24H: nil,
                               priceChange24H: 46.82,
                               priceChangePercentage24H: 6.30848,
                               marketCapChange24H: nil,
                               marketCapChangePercentage24H: nil,
                               circulatingSupply: nil,
                               totalSupply: nil,
                               maxSupply: nil,
                               ath: nil,
                               athChangePercentage: nil,
                               athDate: nil,
                               atl: nil,
                               atlChangePercentage: nil,
                               atlDate: nil,
                               lastUpdated: nil,
                               sparklineIn7D: nil,
                               priceChangePercentage24HInCurrency: nil))
        coinDtos.append(CoinDto(id: "solana",
                               symbol: "sol",
                               name: "Solana",
                               image: "https://coin-images.coingecko.com/coins/images/4128/large/solana.png?1718769756",
                               currentPrice: 198.44,
                               marketCap: nil,
                               marketCapRank: nil,
                               fullyDilutedValuation: nil,
                               totalVolume: nil,
                               high24H: nil,
                               low24H: nil,
                               priceChange24H: 8.91,
                               priceChangePercentage24H: 4.7038,
                               marketCapChange24H: nil,
                               marketCapChangePercentage24H: nil,
                               circulatingSupply: nil,
                               totalSupply: nil,
                               maxSupply: nil,
                               ath: nil,
                               athChangePercentage: nil,
                               athDate: nil,
                               atl: nil,
                               atlChangePercentage: nil,
                               atlDate: nil,
                               lastUpdated: nil,
                               sparklineIn7D: nil,
                               priceChangePercentage24HInCurrency: nil))
        return coinDtos
    }
}

