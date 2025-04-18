//
//  EditContactView.swift
//  ContactsApp
//
//  Created by Joaquin Villarreal on 14/04/2025.
//

import SwiftUI

struct EditContactView: View {
  
  @State private var contact: Model
  
  @Environment(\.dismiss) var dismiss
  
  init(contact: Model) {
    _contact = State(initialValue: contact)
  }

    var body: some View {
        VStack {
          Form {
            TextField(contact.name, text: $contact.name)
            TextField(contact.lastName, text: $contact.lastName)
            TextField(contact.email, text: $contact.email)
              .keyboardType(.emailAddress)
              .textInputAutocapitalization(.never)
              .textContentType(.emailAddress)
          }
          Button(action: {
            
          }){
            Text("Delete Contact")
              .foregroundStyle(.white)
              .background(Color.red)
              
          }
          .padding(.bottom)
          .frame(width: .infinity)
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
              dismiss()
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
    
}

#Preview {
  EditContactView(contact: .init(id: "1", name: "Joaquin", lastName: "Villarreal", email: "joako.2villarreal@gmail.com"))
}
