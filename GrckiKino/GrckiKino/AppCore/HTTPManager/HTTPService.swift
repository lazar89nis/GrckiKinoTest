//
//  HTTPService.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation
import Alamofire

class HTTPService {
    private let session: Session
    
    init(session: Session = Session.default) {
        self.session = session
    }
    
    func request(
        baseURL: String,
        path: String,
        methodType: HTTPMethod,
        parameters: [String : Any]? = nil,
        headers: [String : String]? = nil,
        encoding: ParameterEncoding = JSONEncoding.default,
        requestInterceptor: RequestInterceptor? = nil,
        requestModifier: Session.RequestModifier? = nil
    ) async throws -> Data {
        let url = baseURL + path
        guard let validURL = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            let httpHeaders = headers != nil ? HTTPHeaders(headers!) : nil
            session.request(
                validURL,
                method: methodType,
                parameters: parameters,
                encoding: encoding,
                headers: httpHeaders,
                interceptor: requestInterceptor,
                requestModifier: requestModifier
            )
            .responseData { response in
                switch(response.result) {
                    case let .success(data):
                        if let statusCode = response.response?.statusCode, !(200...299).contains(statusCode) {
                            continuation.resume(throwing: NetworkError.serverError(statusCode: statusCode))
                        } else {
                            continuation.resume(returning: data)
                        }
                    case let .failure(error):
                        continuation.resume(throwing: NetworkError.generalError(error: error))
                }
            }
        }
    }
}
