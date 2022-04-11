//
//  ServiceError.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

enum ServiceError: Error {
    case serviceNotAvailable
    case parsingFailed
    case requestNotFormatted
    
    var description: String {
        switch self {
        case .serviceNotAvailable: return "Service not available"
        case .parsingFailed: return "Parsing failed"
        case .requestNotFormatted: return "Request not formatted"
        }
    }
}
