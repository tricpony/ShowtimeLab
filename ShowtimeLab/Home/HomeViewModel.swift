//
//  HomeViewModel.swift
//  ShowtimeLab
//
//  Created by aarthur on 8/10/22.
//

import Foundation
import UIKit
import Combine

class HomeViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var imageUrl: String = ""
    @Published var uiImage = UIImage()
    var subscribers = Set<AnyCancellable>()

    init() {
        fetchDailyComic()
    }

    func fetchDailyComic() {
        guard let url = URL(string: "https://xkcd.com/info.0.json") else { return }

            URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Comic.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
              if case .failure(let err) = completion {
                print("Network error \(err)")
              }
            }, receiveValue: { [weak self] comic in
                self?.title = comic.title
                self?.imageUrl = comic.imageUrl
            })
            .store(in: &subscribers)
    }
}
