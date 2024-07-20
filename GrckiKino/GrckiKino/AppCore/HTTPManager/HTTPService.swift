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
    
    init(session: Session) {
        self.session = session
    }
    
    func requestWithURL(
        _ strBaseURL: String,
        path: String,
        methodType: HTTPMethod,
        parameters: [String : Any]? = nil,
        header: [String : String]? = nil,
        encoding: ParameterEncoding = JSONEncoding.default,
        requestInterceptor: RequestInterceptor? = nil,
        requestModifier: Session.RequestModifier? = nil
    ) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            let header = header == nil ? nil : HTTPHeaders(header!)
            session.request(
                strBaseURL + path,
                method: methodType,
                parameters: parameters,
                encoding: encoding,
                headers: header,
                interceptor: requestInterceptor,
                requestModifier: requestModifier
            )
            .responseData { response in
                switch(response.result) {
                    case let .success(data):
                        if let statusCode = response.response?.statusCode, statusCode < 200 || statusCode > 300 {
                            continuation.resume(throwing: ErrorCases.errorWithCode(statusCode: statusCode))
                            break
                        }
                        continuation.resume(returning: data)
                    case let .failure(error):
                        continuation.resume(throwing: error)
                }
            }
        }
    }
}
