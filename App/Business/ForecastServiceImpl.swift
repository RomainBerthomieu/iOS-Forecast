//
//  ForecastServiceImpl.swift
//  App
//
//  Created by Romain Berthomieu on 03/04/2025.
//

import Foundation
import Combine

class ForecastServiceImpl: ForecastService {
    var items: CurrentValueSubject<ForecastItems, Never>
    let forecastNetorkService: ForecastNetworkService
    var subscriptions: Set<AnyCancellable>
    
    init(forecastNetorkService: ForecastNetworkService) {
        self.items = CurrentValueSubject<ForecastItems, Never>([])
        self.forecastNetorkService = forecastNetorkService
        self.subscriptions = Set<AnyCancellable>()
        
        forecastNetorkService.getForecast()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error): print("Error \(error)")
                    case .finished: break
                    }
                },
                receiveValue: { [weak self] value in
                    self?.items.send(value.map{ForecastItem(fromDTO: $0)})
                }
            )
            .store(in: &subscriptions)
    }
}
