//
//  HomeView.swift
//  ContactsApp
//
//  Created by Joaquin Villarreal on 14/04/2025.
//

import SwiftUI

struct HomeView: View {
  
  @State private var searchText = ""
  @State private var model: [Model] = [
    .init(id: "1", name: "Joaquín", lastName: "Villarreal", email: "joaquin@joaquinvillarreal.com"),
    .init(id: "2", name: "Joaquín", lastName: "Pérez", email: "joaquin@joaquinvillarreal.com"),
    .init(id: "3", name: "Joaquín", lastName: "Affonso", email: "joaquin@joaquinvillarreal.com")
  ]
  
  @State private var isShowSheet: Bool = false
  
  var body: some View {
    NavigationStack {
      VStack {
        List {
          ForEach(model) { model in
            NavigationLink(value: model) {
              ContactRowView(model: model)
            }
          }
        }
        .sheet(isPresented: $isShowSheet) {
          NewContactView()
            .presentationDetents([.height(300)])
        }
        .navigationDestination(for: Model.self)  { model in
          EditContactView(contact: model)
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
              // Action Sheet
              isShowSheet = true
            }){
              Image(systemName: "plus")
                .tint(.black)
            }
          }
        }
      }
      .searchable(text: $searchText, prompt: "Search")
      .navigationTitle("Contacts")
    }
    .tint(.black)
  }
}

#Preview {
  HomeView()
}
