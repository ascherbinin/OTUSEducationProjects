//
// Location.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct Location: Codable {

    public var id: Int?
    public var name: String?
    public var type: String?
    public var dimension: String?
    public var url: String?

    public init(id: Int?, name: String?, type: String?, dimension: String?, url: String?) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.url = url
    }


}

