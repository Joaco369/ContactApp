//
//  ContentView.swift
//  ContactsApp
//
//  Created by Joaquin Villarreal on 14/04/2025.
//

import SwiftUI

struct ContentView: View {
  
    @State private var viewModel = ContactsViewModel()
  
    var body: some View {
      HomeView()
        .environment(viewModel)
    }
}

#Preview {
    ContentView()
}
