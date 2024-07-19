//
//  HTTPManager.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation
import Alamofire

class HTTPManager {
    
    private var service: HTTPService!
    
    static let shared: HTTPManager = {
        let instance = HTTPManager()
        instance.service = HTTPService(session: Session(configuration: .default))
        return instance
    }()
    
    func getRounds(gameId: Int) async -> Result<Data, ErrorCases> {
        do {
            let data = try await self.service.requestWithURL(
                Config.baseUrl,
                path: "/\(gameId)/upcoming/20",
                methodType: .get)
            return .success(data)
        } catch {
            if let er = error as? ErrorCases {
                return .failure(er)
            }
            return .failure(.generalError)
        }
    }
}
