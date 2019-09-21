
**[NOTE]**  
If you'd like to see `QGrid` in action, check out this demo of early alpha version of `QDesigner`:  
If you want to influence the future of app design & development, please [Retweet this](https://twitter.com/karolkulesza/status/1173670811598761985) and register for Beta at: [https://Q-Mobile.IT/Q-Designer](https://Q-Mobile.IT/Q-Designer)

[![QDesigner Preview](QDesignerPreview.png)](https://youtu.be/_nCM9O-v7mQ)

![QGrid: The missing SwiftUI collection view.](QGridLogo.png)

<p align="center">
	<a href="https://app.bitrise.io/app/f0f6bc185b95894e"><img src="https://img.shields.io/bitrise/f0f6bc185b95894e?token=oz0lqEXxqGjU-kKRf983_w" alt=“Build Status"/></a>
    <img src="https://img.shields.io/badge/platform-iOS | macOS-blue.svg?style=flat" alt="Platforms" />
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ Xcode 11.0  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ Swift 5+  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ iOS 13+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ tvOS 13+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ watchOS 6+


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
      Text(person.firstName).lineLimit(1)
      Text(person.lastName).lineLimit(1)
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
    	<img src="QGridTestApp/Screenshots/People3.png" width="800"/>
    </th>
  </tr>
  <tr>
	 <th>
    	<img src="QGridTestApp/Screenshots/People4.png" width="800"/>
    </th>
  </tr>
</table>
</center>

## 🔷 QGrid Designer

📱`QGridTestApp` contains also the QGrid Designer area view, with sliders for dynamic run-time configuration of the QGrid view (with config option to hide it). Please refer to the following demo executed on the device:

<p align="center">
<img src="QGridDesignerDemo.gif"/>
</p>

## 🔷 Roadmap / TODOs

Version `0.1.1` of `QGrid ` contains a very limited set of features. It could be extended by implementing the following tasks:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;☘️ Parameterize spacing&padding configuration depending on the device orientation  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;☘️ Add the option to specify scroll direction  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;☘️ Add content-only initializer to QGrid struct, without a collection of identified data as argument (As in SwiftUI’s `List`)  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;☘️ Add support for other platforms (watchOS)  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;☘️ Add `Stack` layout option (as in `UICollectionView`)  
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
