//
//  HTTPManager.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation
import Alamofire

class HTTPManager {
    private var service: HTTPService
    
    static let shared: HTTPManager = {
        let instance = HTTPManager(service: HTTPService(session: Session(configuration: .default)))
        return instance
    }()
    
    init(service: HTTPService) {
        self.service = service
    }
    
    func getRounds(gameId: Int) async -> Result<Data, NetworkError> {
        do {
            let data = try await service.request(
                baseURL: Config.baseUrl,
                path: "/\(gameId)/upcoming/20",
                methodType: .get)
            return .success(data)
        } catch let error as NetworkError {
            return .failure(error)
        } catch {
            return .failure(.generalError(error: error))
        }
    }
    
    func getRound(gameId: Int, drawId: String) async -> Result<Data, NetworkError> {
        do {
            let data = try await service.request(
                baseURL: Config.baseUrl,
                path: "/\(gameId)/\(drawId)",
                methodType: .get)
            return .success(data)
        } catch let error as NetworkError {
            return .failure(error)
        } catch {
            return .failure(.generalError(error: error))
        }
    }
    
    func getResults(gameId: Int, fromDate: String, toDate: String) async -> Result<Data, NetworkError> {
        do {
            let data = try await service.request(
                baseURL: Config.baseUrl,
                path: "/\(gameId)/draw-date/\(fromDate)/\(toDate)",
                methodType: .get)
            return .success(data)
        } catch let error as NetworkError {
            return .failure(error)
        } catch {
            return .failure(.generalError(error: error))
        }
    }
}
