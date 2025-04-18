//
//  NewContactView.swift
//  ContactsApp
//
//  Created by Joaquin Villarreal on 14/04/2025.
//

import SwiftUI

struct NewContactView: View {
  
  @State private var name = ""
  @State private var lastName = ""
  @State private var email = ""
  
  @Environment(\.dismiss) var dismiss
  
    var body: some View {
      NavigationStack {
        Form {
          TextField("First name", text: $name)
          TextField("Last name", text: $lastName)
          TextField("Email", text: $email)
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
            .textInputAutocapitalization(.never)
        }
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button(action: {
              // Action confirm
            }){
              Text("Done")
                .tint(.black)
                .font(.headline)
            }
          }
          ToolbarItem(placement: .topBarLeading) {
            Button(action: {
              // Action
              dismiss()
            }){
              Text("Cancel")
                .tint(.black)
            }
          }
        }
        .navigationBarTitle("New Contact", displayMode: .inline)
      }
    }
}

#Preview {
  NewContactView()
}
