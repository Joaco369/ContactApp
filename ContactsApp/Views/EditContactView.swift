//
//  EditContactView.swift
//  ContactsApp
//
//  Created by Joaquin Villarreal on 14/04/2025.
//

import SwiftUI

struct EditContactView: View {
  
  @Environment(ContactsViewModel.self) var viewModel
  @Environment(\.dismiss) var dismiss
  
  @State private var contact: Model
  
  init(contact: Model) {
    _contact = State(initialValue: contact)
  }

    var body: some View {
        VStack {
          Form {
            TextField("First Name", text: $contact.firstName)
            TextField("Last Name", text: $contact.lastName)
            TextField("Email", text: $contact.email)
              .keyboardType(.emailAddress)
              .textInputAutocapitalization(.never)
              .textContentType(.emailAddress)
          }
          Button(action: {
            deleteContact()
          }){
            Text("Delete Contact")
              .foregroundStyle(.white)
              .background(Color.red)
              
          }
          .padding(.bottom)
        }
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Button(action: {
              dismiss()
            }){
              Text("Cancel")
                .tint(.black)
            }
          }
          ToolbarItem(placement: .topBarTrailing) {
            Button(action: {
              updateContact()
            }){
              Text("Save")
                .tint(.black)
                .font(.headline)
            }
          }
        }
        .navigationTitle("Edit Contact")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
      }
  private func updateContact() {
    viewModel.updateContact(contact)
    dismiss()
  }
  private func deleteContact() {
    viewModel.deleteContact(contact)
    dismiss()
  }
}

#Preview {
  EditContactView(contact: .init(id: "1", firstName: "Joaquin", lastName: "Villarreal", email: "joako.2villarreal@gmail.com"))
    .environment(ContactsViewModel())
}
