//
//  APIClient.swift
//  spotify-clone
//
//  Created by Dani on 10/6/23.
//

import Foundation

class APIClient {
    // MARK: - Fetch Data

    func fetchData(from url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NSError(domain: "InvalidResponse", code: 0, userInfo: nil)
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NSError(domain: "HTTPError", code: httpResponse.statusCode, userInfo: nil)
        }

        /// Use JSONDecoder with correct data model before catch data
        return data
    }
}
