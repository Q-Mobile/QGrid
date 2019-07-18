//
//  PeopleView.swift
//  QGrid
//
//  Created by Karol Kulesza on 7/06/19.
//  Copyright © 2019 Q Mobile { http://Q-Mobile.IT }
//

import SwiftUI
import QGrid

struct PeopleView: View {
  var body: some View {
    ZStack {
      Color.clear
      .background(self.backgroundGradient, cornerRadius: 0)
      .edgesIgnoringSafeArea(.all)
      QGrid(Storage.people,
            columns: 3,
            columnsInLandscape: 4,
            vSpacing: 20,
            hSpacing: 20,
            vPadding: 20,
            hPadding: 20) { person in
              GridCell(person: person)
      }
    }
  }
  
  var backgroundGradient: LinearGradient {
    let gradient = Gradient(colors: [
      Color(red: 192/255.0, green: 192/255.0, blue: 192/255.0),
      Color(red: 50/255.0, green: 50/255.0, blue: 50/255.0)
    ])
    return LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
  }
}

struct GridCell: View {
  var person: Person

  var body: some View {
    VStack() {
      Image(person.imageName)
        .resizable()
        .scaledToFit()
        .clipShape(Circle())
        .shadow(color: .primary, radius: 5)
        .padding([.horizontal, .top], 7)
      Text(person.firstName).font(.headline).color(.white)
      Text(person.lastName).font(.headline).color(.white)
    }
  }
}

#if DEBUG
struct ListView_Previews : PreviewProvider {
  static var previews: some View {
    PeopleView()
  }
}
#endif

