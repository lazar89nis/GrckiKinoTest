//
//  ErrorCases.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

enum ErrorCases: Error {
    case generalError
    case errorWithCode(statusCode: Int)
}
