//
//  ContactRowView.swift
//  ContactsApp
//
//  Created by Joaquin Villarreal on 14/04/2025.
//

import SwiftUI

struct ContactRowView: View {
  
  let model: Model
  
    var body: some View {
      HStack {
        Text(model.initials ?? "")
          .foregroundStyle(.white)
          .frame(width: 48, height: 48)
          .background(Color(.systemGray3))
          .clipShape(.circle)
        VStack(alignment: .leading) {
          Text("\(model.firstName) \(model.lastName)")
            .fontWeight(.bold)
          Text(model.email)
            .foregroundStyle(.gray)
        }
      }
    }
}

#Preview {
  ContactRowView(model: .init(id: "1", firstName: "Joaquin", lastName: "Villarreal", email: "joaquin@joaquin.com"))
}
