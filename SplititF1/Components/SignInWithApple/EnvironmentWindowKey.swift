//
//  EnvironmentWindowKey.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 04/06/2023.
//

import UIKit
import SwiftUI

struct WindowKey: EnvironmentKey {
  struct Value {
    weak var value: UIWindow?
  }
  
  static let defaultValue: Value = .init(value: nil)
}

extension EnvironmentValues {
  var window: UIWindow? {
    get { return self[WindowKey.self].value }
    set { self[WindowKey.self] = .init(value: newValue) }
  }
}
