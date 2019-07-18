![QGrid: The missing SwiftUI collection view.](QGridLogo.png)

<p align="center">
    <a href="https://travis-ci.org/Q-Mobile/QGrid"><img src="https://img.shields.io/travis/Q-Mobile/QGrid.svg?style=flat" alt="CI Status"/></a>
    <img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
    <img src="https://img.shields.io/badge/Swift-5-orange.svg" />
    <a href="https://swift.org/package-manager"><img src="https://img.shields.io/badge/SPM-Compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" /></a>
    <a href="https://raw.githubusercontent.com/q-mobile/QGrid/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
    <a href="https://twitter.com/karolkulesza"><img src="https://img.shields.io/badge/contact-@karolkulesza-blue.svg?style=flat" alt="Twitter: @karolkulesza" /></a>
</p>

`QGrid` is the missing SwiftUI collection view. It uses the same approach as SwiftUI's `List` view, by computing its cells on demand from an underlying collection of identified data.

<center>
<img src="QGridDemo.gif"/>
</center>


## 🔷 Requirements

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ macOS 10.15+  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ Xcode 11+  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ Swift 5+  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ iOS 13+

## 🔷 Installation

`QGrid` is available via [Swift Package Manager](https://swift.org/package-manager).

Using Xcode 11, go to `File -> Swift Packages -> Add Package Dependency` and enter [https://github.com/Q-Mobile/QGrid](https://github.com/Q-Mobile/QGrid)  

## 🔷 Usage

#### ✴️ Basic scenario:  

In its simplest form, `QGrid` can be used with just this 1 line of code within the `body` of your View, assuming you already have a custom cell view:

```Swift
struct PeopleView: View {
  var body: some View {
    QGrid(Storage.people, columns: 3) { GridCell(person: $0) }
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
```

#### ✴️ Customize the default layout configuration:

You can customize how `QGrid` will layout your cells by providing some additional initializer parameters, which have default values:

```swift
struct PeopleView: View {
  var body: some View {
    QGrid(Storage.people,
          columns: 3,
          columnsInLandscape: 4,
          vSpacing: 50,
          hSpacing: 20,
          vPadding: 100,
          hPadding: 20) { person in
            GridCell(person: person)
    }
  }
}   
```

## 🔷 Example App

📱`QGridTestApp` directory in this repository contains a very simple application that uses `QGrid`. Open `QGridTestApp/QGridTestApp.xcodeproj` and either use the new Xcode Previews feature or just run the app.


<center>
<table bordercolor=white>
  <tr>
    <th>
      <img src="QGridTestApp/Screenshots/People1.png" width="400"/>
    </th>
    <th>
      <img src="QGridTestApp/Screenshots/People2.png" width="400"/>
    </th>
  </tr>
</table>
<table bordercolor=white>
  <tr>
	 <th>
    	<img src="QGridTestApp/Screenshots/People3.png" width="1000"/>
    </th>
  </tr>
</table>
</center>

## 🔷 Roadmap / TODOs

Version `0.1.0` of `QGrid ` contains a very limited set of features. It could be extended by implementing the following tasks:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;☘️ Parameterize spacing&padding configuration depending on the device orientation  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;☘️ Add support for other platforms (macOS, tvOS, watchOS)  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;☘️ Add unit/UI tests  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;☘️ ... many other improvements

## 🔷 Contributing

👨🏻‍🔧 Feel free to contribute to `QGrid ` by creating a pull request, following these guidelines:

1. Fork `QGrid `
2. Create your feature branch
3. Commit your changes, along with unit tests
4. Push to the branch
5. Create pull request


## 🔷 Author

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;👨‍💻 [Karol Kulesza](https://github.com/karolkulesza) ([@karolkulesza](https://twitter.com/karolkulesza))


## 🔷 License

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;📄 QGrid is available under the MIT license. See the LICENSE file for more info.
