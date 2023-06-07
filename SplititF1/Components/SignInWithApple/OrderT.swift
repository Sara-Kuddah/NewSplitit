//
//  Order.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 05/06/2023.
//

import Foundation


struct order: Codable {
    let id: UUID
    let locationID: Location
    let merchant_name: String
    let app_name: String
    let delivery_fee: Int
    let checkpoint: String
    let notes: String?
    let active: Bool?
    let status: String?
    let updatedAt: Date?
    let createdAt: Date?
}



// MARK: - Location
struct Location: Codable{
    let id: String
}
