//
//  HomeView.swift
//  ContactsApp
//
//  Created by Joaquin Villarreal on 14/04/2025.
//

import SwiftUI

struct HomeView: View {
  
  @Binding var searchText: String
  
  var body: some View {
    NavigationStack {
      VStack {
        
      }
      .searchable(text: $searchText)
      .navigationTitle("Contacts")
    }
  }
}

#Preview {
  HomeView(searchText: .constant(""))
}
