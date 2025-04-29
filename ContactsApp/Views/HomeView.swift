//
//  HomeView.swift
//  ContactsApp
//
//  Created by Joaquin Villarreal on 14/04/2025.
//

import SwiftUI

struct HomeView: View {
  
  @Environment(ContactsViewModel.self) var viewModel
  @State private var isShowSheet: Bool = false
  @State private var searchText = ""
  
  var searchResults: [Model] {
    viewModel.filterContact(for: searchText)
  }
  
  var body: some View {
    NavigationStack {
      VStack {
        List {
          ForEach(searchResults) { model in
            NavigationLink(value: model) {
              ContactRowView(model: model) {
                withAnimation(.easeInOut(duration: 0.5)) {
                  viewModel.deleteContact(model)
                }
              }
            }
          }
        }
        .searchable(text: $searchText)
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
      .navigationTitle("Contacts")
    }
    .tint(.black)
  }
}

#Preview {
  HomeView()
}
