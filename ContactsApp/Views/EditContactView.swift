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
  @State private var contactDidChange = false
  @State private var showExitConfirmation = false
  @State private var showDeleteConfirmation = false
  private let originalContact: Model
  
  init(contact: Model) {
    _contact = State(initialValue: contact)
    originalContact = contact
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
            showDeleteConfirmation = true
          }){
            Text("Delete Contact")
              .frame(maxWidth: .infinity, maxHeight: 50)
              .foregroundStyle(.white)
              .background(Color.red)
              .clipShape(.rect(cornerRadius: 10))
              .padding(.horizontal)
          }
        }
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Button(action: {
              onCancel()
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
                .disabled(!contactDidChange)
                .opacity(contactDidChange ? 1 : 0.5)
                .tint(.black)
                .font(.headline)
            }
          }
        }
        .alert(isPresented: $showExitConfirmation) {
          alertExitConfirmation
        }
        .alert(isPresented: $showDeleteConfirmation) {
          alertDeleteConfirmation
        }
        .onChange(of: contact, { oldValue, newValue in
          contactDidChange = newValue != originalContact
        })
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
  private func onCancel() {
    if contactDidChange {
      showExitConfirmation = true
    } else {
      dismiss()
    }
  }
  private var alertExitConfirmation: Alert {
    Alert(title: Text("Unsaved Changes"), message: Text("You have unsaved changes. Do you want to save them before leaving?"), primaryButton: .destructive(Text("Discard Changes"), action: {
      dismiss()
    }), secondaryButton: .default(Text("Stay")))
  }
  private var alertDeleteConfirmation: Alert {
    Alert(title: Text("Delete Contact"), message: Text("You have delete contact. Do you want to delete them before leaving?"), primaryButton: .default(Text("Cancel")), secondaryButton: .destructive(Text("Delete"), action: {
      deleteContact()
    }))
  }
}

#Preview {
  EditContactView(contact: .init(id: "1", firstName: "Joaquin", lastName: "Villarreal", email: "joako.2villarreal@gmail.com"))
    .environment(ContactsViewModel())
}
