//
//  RemoteRepositoryMock.swift
//
//
//  Created by Marcelo Mogrovejo on 02/01/2024.
//

import Foundation
@testable import CryptoRepoPackage

class RemoteRepositoryMock: RepositoryProtocol {

    typealias T = CoinDto

    private(set) var isListCalled = false
    private(set) var numberOfTimesIsCalledList = 0
    var listSuccess = true
    var listReturnData: [CoinDto] = []

    func list() async throws -> [CoinDto] {
        if listSuccess {
            isListCalled = true
            numberOfTimesIsCalledList += 1
            return listReturnData
        } else {
            // TODO: -
            throw RepositoryError.notFound
        }
    }

}
