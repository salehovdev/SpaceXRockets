# 🚀 SpaceXRockets

A simple iOS application that displays **SpaceX rockets** and their **launch history**, built with **SwiftUI**, **Firebase Authentication**, **SwiftData** for offline caching, and **SpaceX public API**.

---

## 📱 Features

- 🔐 **Firebase Google Sign-In Authentication**
- 📦 **SwiftData local storage** for offline caching of both rockets and launches
- 📡 **Async/Await** networking with generic Codable-based data parsing
- 🌐 Launch details include links to **Wikipedia/Articles** opened **inside the app**
- 📆 Rocket and Launch metadata including:
  - Rocket name, first flight, mass, diameter, height, success rate
  - Launch name, date, success, description, image patch

---

## 📂 Architecture

- 🧼 Follows **Clean Architecture**
- 🧩 Layered: `ViewModel`, `Model`, `Service`
- 📥 **Caching-first** data flow:
  - On first launch: API fetch → Cache in SwiftData
  - On later runs: Try load from cache → fallback to API
- 🔧 SPM (Swift Package Manager) used for dependencies

---

## 🔗 APIs

- [Rockets API](https://api.spacexdata.com/v4/rockets)
- [Launches API](https://api.spacexdata.com/v5/launches)
