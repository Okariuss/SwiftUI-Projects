# 🪙 Cryptoroid — A SwiftUI Crypto Tracker App

**Cryptoroid** is a beautifully structured cryptocurrency tracking app built with SwiftUI and modern iOS development techniques. It allows users to monitor live market data, manage a personal coin portfolio, and explore in-depth coin statistics — all powered by `MVVM`, `Core Data`, `Combine` and responsive UI design.

---

## 🚀 Features

- Live market data fetched from **CoinGecko API**
- Detailed coin statistics and interactive price charts
- Portfolio management with real-time value calculation
- Data persistence using **Core Data** for portfolio storage
- Custom line chart built using `Shape` and SwiftUI animation
- Optimized image loading with `FileManager` caching
- Seamless support for **Light** & **Dark Mode**
- MVVM architecture with `@Published` bindings and separation of concerns
- `Combine` integration
- Fully testable logic with modular architecture
- Reusable developer previews via `DeveloperPreview.instance`

---

## 🧪 Test Coverage

The project is covered with unit tests using the `Testing` framework:

---

## 🛠️ Built With

| Technology       | Description                                  |
|------------------|----------------------------------------------|
| Swift 6.1.2       | Language version                             |
| SwiftUI           | Declarative UI framework                     |
| Core Data         | Local persistence for portfolio              |
| Combine           | Reactive programming for data flow           |
| MVVM              | Clean separation of concerns                 |
| Swift Testing     | Native unit testing framework                |
| FileManager       | Image caching for performance                |
| CoinGecko API     | Free crypto market data provider             |
| Shape             | Used to draw custom chart visuals            |

---

## 📱 Screenshots

| Home View | Settings | Portfolio | Edit Portfolio | Coin Detail |
|-----------|-------------|-----------|-------------|-------------|
| ![Home](Records/home.gif) | ![Settings](Records/settings.gif) | ![Portfolio](Records/portfolio.gif) | ![Edit Portfolio](Records/edit-portfolio.gif) | ![Coin Detail](Records/coin-detail.gif) |

---

## ✅ Running Tests

To run unit tests:

- Open `Cryptoroid` in Xcode
- Press ⌘U or go to **Product > Test**

---

## 📄 License

This project is open-sourced under the MIT License. See the LICENSE file for details.

---
