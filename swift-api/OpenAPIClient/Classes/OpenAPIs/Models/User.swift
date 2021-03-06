//
// User.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct User: Codable {

    public var id: Int?
    public var login: String?
    public var avatarUrl: String?

    public init(id: Int?, login: String?, avatarUrl: String?) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
    }


}

