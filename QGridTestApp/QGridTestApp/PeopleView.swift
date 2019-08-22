//
//  PeopleView.swift
//  QGrid
//
//  Created by Karol Kulesza on 7/06/19.
//  Copyright © 2019 Q Mobile { http://Q-Mobile.IT }
//

import SwiftUI
import QGrid


struct QConstants {
  static let showDesigner = true
  static let columnsMax = 8
  static let vSpacingMaxToGeometryRatio: CGFloat = 0.5 // 50%
  static let vPaddingMaxToGeometryRatio: CGFloat = 0.3 // 30%
  static let hPaddingMaxToGeometryRatio: CGFloat = 0.3 // 30%
}

struct PeopleView: View {
  @State var columns: CGFloat = 3.0
  @State var vSpacing: CGFloat = 10.0
  @State var hSpacing: CGFloat = 10.0
  @State var vPadding: CGFloat = 0.0
  @State var hPadding: CGFloat = 10.0
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        self.backgroundGradient
        .edgesIgnoringSafeArea(.all)
        VStack {
          if (QConstants.showDesigner) { self.designerView(geometry) }
          self.gridView(geometry)
        }
      }
    }
  }
  
  private func gridView(_ geometry: GeometryProxy) -> some View {
    QGrid(Storage.people,
          columns: Int(self.columns),
          columnsInLandscape: Int(self.columns),
          vSpacing: min(self.vSpacing, self.vSpacingMax(geometry)),
          hSpacing: max(min(self.hSpacing, self.hSpacingMax(geometry)), 0.0),
          vPadding: min(self.vPadding, self.vPaddingMax(geometry)),
          hPadding: max(min(self.hPadding, self.hPaddingMax(geometry)), 0.0)) {
      GridCell(person: $0)
    }
  }
  
  private func designerView(_ geometry: GeometryProxy) -> some View {
    return
      VStack {
        layoutSlider(name: "Columns:",
                     layoutParam: self.$columns,
                     minValue: 1.0,
                     maxValue: CGFloat(QConstants.columnsMax))
        layoutSlider(name: "vSpacing:",
                     layoutParam: self.$vSpacing,
                     maxValue: self.vSpacingMax(geometry))
        layoutSlider(name: "hSpacing:",
                     layoutParam: self.$hSpacing,
                     maxValue: self.hSpacingMax(geometry))
        layoutSlider(name: "vPadding:",
                     layoutParam: self.$vPadding,
                     maxValue: self.vPaddingMax(geometry))
        layoutSlider(name: "hPadding:",
                     layoutParam: self.$hPadding,
                     maxValue: self.hPaddingMax(geometry))
      }
      .padding([.bottom], 10)
  }
  
  private func layoutSlider(name: String,
                            layoutParam: Binding<CGFloat>,
                            minValue: CGFloat = 0.0,
                            maxValue: CGFloat) -> some View {
    HStack {
      Text(name)
      Text("\(Int(min(layoutParam.wrappedValue, maxValue)))")
      Slider(value: layoutParam, in: minValue...maxValue, step: 1.0)
    }
    .font(.headline).foregroundColor(.white)
    .padding([.horizontal], 10)
    .padding([.bottom], -10)
  }
  
  private func vSpacingMax(_ geometry: GeometryProxy) -> CGFloat {
    return geometry.size.height * QConstants.vSpacingMaxToGeometryRatio
  }
  
  private func hSpacingMax(_ geometry: GeometryProxy) -> CGFloat {
    return max(geometry.size.width/self.columns - 2 * hPadding, 1.0)
  }
  
  private func vPaddingMax(_ geometry: GeometryProxy) -> CGFloat {
    return geometry.size.height * QConstants.vPaddingMaxToGeometryRatio
  }
  
  private func hPaddingMax(_ geometry: GeometryProxy) -> CGFloat {
    return geometry.size.width * QConstants.hPaddingMaxToGeometryRatio
  }

  private var backgroundGradient: LinearGradient {
    let gradient = Gradient(colors: [
      Color(red: 192/255.0, green: 192/255.0, blue: 192/255.0),
      Color(red: 50/255.0, green: 50/255.0, blue: 50/255.0)
    ])
    return LinearGradient(gradient: gradient,
                          startPoint: .top,
                          endPoint: .bottom)
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
      Text(person.firstName).lineLimit(1)
      Text(person.lastName).lineLimit(1)
    }
    .font(.headline).foregroundColor(.white)
  }
}

#if DEBUG
struct ListView_Previews : PreviewProvider {
  static var previews: some View {
    PeopleView()
  }
}
#endif
