// - Since: 10/02/2019
// - Author: Arkadii Hlushchevskyi
// - Copyright: © 2022. Arkadii Hlushchevskyi.
// - Seealso: https://github.com/adya/TSKit.Core/blob/master/LICENSE.md

import Foundation

public class DictionaryDecoder {

    private let decoder = JSONDecoder()

    public var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy {
        set { decoder.dateDecodingStrategy = newValue }
        get { return decoder.dateDecodingStrategy }
    }

    public var dataDecodingStrategy: JSONDecoder.DataDecodingStrategy {
        set { decoder.dataDecodingStrategy = newValue }
        get { return decoder.dataDecodingStrategy }
    }

    public var nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy {
        set { decoder.nonConformingFloatDecodingStrategy = newValue }
        get { return decoder.nonConformingFloatDecodingStrategy }
    }

    public var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        set { decoder.keyDecodingStrategy = newValue }
        get { return decoder.keyDecodingStrategy }
    }
    
    public init() {}

    public func decode<T>(_ type: T.Type, from dictionary: [String: Any]) throws -> T where T: Decodable {
        let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
        return try decoder.decode(type, from: data)
    }
    
    public func decode<T>(_ type: T.Type, from array: [[String: Any]]) throws -> T where T: Decodable {
        let data = try JSONSerialization.data(withJSONObject: array, options: [])
        return try decoder.decode(type, from: data)
    }
}
