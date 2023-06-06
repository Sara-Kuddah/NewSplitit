//
//  Order.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 05/06/2023.
//

import Foundation


struct order: Codable {
    let id: UUID
    let location: Location
    let merchantName: String
    let appName: String
    let deliveryFee: Int
    let checkpoint: String
    let notes: String?
    let active: Bool?
    let status: String?
    let updatedAt: Date?
    let createdAt: Date?
}

struct orderReqBody: Codable {
    let merchantName: String
    let appName: String
    let deliveryFee: Int
    let checkpoint: String
    let notes: String?
    let active: Bool?
    let status: String?
}

// MARK: - Location
struct Location: Codable{
    let id: String
}
