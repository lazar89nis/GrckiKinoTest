//
//  ErrorCases.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case serverError(statusCode: Int)
    case decodingError
    case generalError(error: Error)
    
    var localizedDescription: String {
        switch self {
            case .invalidURL:
                return "Invalid URL"
            case .serverError(let statusCode):
                return "Server error with status code: \(statusCode)"
            case .decodingError:
                return "Decoding error"
            case .generalError(let error):
                return error.localizedDescription
        }
    }
}
