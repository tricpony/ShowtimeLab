//
//  Loader.swift
//  ShowtimeLab
//
//  Created by aarthur on 8/10/22.
//

import Foundation
import Combine

struct ServiceError: Error, LocalizedError {
    var errorDescription: String?
    init(errorDescription: String?) {
        self.errorDescription = errorDescription
    }
}

class Loader<T: Decodable> {
    var subscribers = Set<AnyCancellable>()

    func fetch(url: URL?, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(ServiceError(errorDescription: "Invalid URL")))
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { fin in
                if case .failure(let err) = fin {
                    completion(.failure(ServiceError(errorDescription: "Network error \(err)")))
                }
            }, receiveValue: { comic in
                completion(.success(comic))
            })
            .store(in: &subscribers)
    }
}
