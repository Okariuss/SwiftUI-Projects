# 📋 TodoList — A SwiftUI Application

A lightweight yet powerful **To-Do List** app built using SwiftUI and MVVM architecture. This app allows users to add, complete, delete, and reorder tasks with smooth animations. All data is persisted using `UserDefaults`.


## 🚀 Features
- Add, delete, update tasks
- Mark tasks as complete/incomplete
- Reorder tasks with drag & drop
- Animated "no items" view with call to action
- Persistent storage using `UserDefaults`
- Clean architecture with `@State` and `@EnvironmentObject`
- Unit tests powered by the new **Swift Testing** framework (introduced in Swift 5.10)

---

## 🧪 Test Coverage

The project uses the new `Testing` framework introduced at **WWDC24**:

- `ItemModelTests.swift`:
  - Tests for toggling completion state
- `ListViewModelTests.swift`:
  - Adding, deleting, moving, and updating items
  - Persistence to and loading from `UserDefaults`

---

## 🛠️ Built With

| Technology       | Description                         |
|------------------|-------------------------------------|
| Swift 5.10        | Language version                    |
| SwiftUI           | UI framework                        |
| MVVM              | Architecture pattern                |
| Swift Testing     | New native testing framework        |
| UserDefaults      | Simple persistent storage           |

---

## 📱 Screenshots

| Main View | Empty State | Add Item |
|-----------|-------------|----------|
|  |  |  |

---

## ✅ Running Tests

All unit tests are located in ListViewModelTests.swift and ItemModelTests.swift.

To run the tests:
- Press ⌘U in Xcode
- Or go to Product > Test

---

## 📄 License

This project is open-sourced under the MIT License. See the LICENSE file for details.
