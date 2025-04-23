//
//  Model.swift
//  ContactsApp
//
//  Created by Joaquin Villarreal on 14/04/2025.
//

import SwiftUI

struct Model: Identifiable, Hashable {
  let id: String
  var firstName: String
  var lastName: String
  var email: String
  
  var initials: String? {
    let first = firstName.prefix(1)
    let last = lastName.prefix(1)
    
    return String(first + last)
  }
}
