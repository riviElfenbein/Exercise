//
//  Response.swift
//  Exercise
//
//  Created by Rivi Elf on 05/11/2020.
//

import Foundation

struct Response {
    fileprivate var data: Data
    init(data: Data) {
        self.data = data
    }
}

extension Response {
    public func decode<UI>(_ type: UI.Type) -> Data {
        return data
    }
    
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch let error {
            print(error)
            return nil
        }
    }
}
