//
//  CatFactModel.swift
//  GenericsAndProtocolApi
//
//  Created by Alphonsa Varghese on 23/03/22.
//

import Foundation

// MARK: - CatFactModelElement
struct CatFactModelElement: Codable {
    let status: Status
    let id, user, text: String
    let v: Int
    let source, updatedAt, type, createdAt: String
    let deleted, used: Bool

    enum CodingKeys: String, CodingKey {
        case status
        case id = "_id"
        case user, text
        case v = "__v"
        case source, updatedAt, type, createdAt, deleted, used
    }
}

// MARK: - Status
struct Status: Codable {
    let verified: Bool
    let feedback: String?
    let sentCount: Int
}

typealias CatFactModel = [CatFactModelElement]
