//
//  RepositoryProtocol.swift
//  CryptoRepoPackage
//
//  Created by Marcelo Mogrovejo on 02/12/2023.
//

import Foundation
import Combine

protocol RepositoryProtocol {

    associatedtype T

    /// Fetch a list of items.
    ///
    /// Source: https://docs.coingecko.com/v3.0.1/reference/coins-markets
    ///
    func list() async throws -> [T]
}
