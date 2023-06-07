//
//  UserProfile.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 04/06/2023.
//

import Foundation

struct UserProfile: Codable {
  let id: UUID
  let email: String
  let firstName: String?
  let lastName: String?
    
}
