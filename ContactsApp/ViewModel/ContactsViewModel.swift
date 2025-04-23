//
//  ContactsViewModel.swift
//  ContactsApp
//
//  Created by Joaquin Villarreal on 21/04/2025.
//

import Observation

@Observable
class ContactsViewModel {
  
  var models = [Model]()
  
  init() {
    fetchContact()
  }
  
  func fetchContact() {
    models = [
    .init(id: "1", firstName: "Joaquín", lastName: "Villarreal", email: "joaquin@joaquinvillarreal.com"),
    .init(id: "2", firstName: "Joaquín", lastName: "Pérez", email: "joaquin@joaquinvillarreal.com"),
    .init(id: "3", firstName: "Joaquín", lastName: "Affonso", email: "joaquin@joaquinvillarreal.com")
    ]
  }
  
  func addContact(_ model: Model) {
    models.append(model)
  }
  
  func deleteContact(_ model: Model) {
    guard let index = models.firstIndex(where: { $0.id == model.id }) else { return }
    models.remove(at: index)
  }
  func updateContact(_ model: Model) {
    guard let index = models.firstIndex(where: { $0.id == model.id }) else { return }
    models[index] = model
  }
}
