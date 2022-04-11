//
//  ResponseConverter.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import Foundation

protocol ResponseConvertible {
    associatedtype Entity
    func convert() -> Entity
}

extension Array where Element: ResponseConvertible {

    func convert() -> [Element.Entity] {
        map { $0.convert() }
    }
}

protocol ResponseParameterConvertible {
    associatedtype Entity
    associatedtype Parameter
    func convert(parameter: Parameter) -> Entity
}

extension Array where Element: ResponseParameterConvertible {

    func convert(parameter: Element.Parameter) -> [Element.Entity] {
        map { $0.convert(parameter: parameter) }
    }
}
