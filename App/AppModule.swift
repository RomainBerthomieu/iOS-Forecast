//
//  AppModule.swift
//  App
//
//

import Global

public class AppModule: Module {
    public static var shared = AppModule()
    private init() {
        // Singleton
    }

    public func registerServices() {
        GlobalContainer.defaultContainer.register(ForecastNetworkService.self) { _ in ForecastNetworkServiceImpl() }
        GlobalContainer.defaultContainer.register(ForecastService.self) { r in
            ForecastServiceImpl(forecastNetorkService: r.resolve(ForecastNetworkService.self)!)
        }
    }
}
