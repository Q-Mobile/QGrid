//
//  Storage.swift
//  QGrid
//
//  Created by Karol Kulesza on 7/06/19.
//  Copyright © 2019 Q Mobile { http://Q-Mobile.IT }
//

import SwiftUI


struct Person : Codable, Identifiable {
  var id: Int
  var firstName: String
  var lastName: String
  var imageName: String
}

struct Storage {
  static var people: [Person] = load("people.json")
  
  static func load<T: Decodable>(_ file: String) -> T {
    guard let url = Bundle.main.url(forResource: file, withExtension: nil),
          let data = try? Data(contentsOf: url),
          let typedData = try? JSONDecoder().decode(T.self, from: data) else {
      fatalError("Error while loading data from file: \(file)")
    }
    return typedData;
  }
}
