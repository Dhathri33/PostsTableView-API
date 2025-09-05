# 📱 TableView-API (iOS Swift)
This project demonstrates how to build a **UITableView** in Swift that fetches and displays data from a remote API.  
It was **first implemented in MVC architecture** and later **refactored to MVVM architecture** to improve code separation and maintainability.

---

## ✨ Features
- Fetches data from a remote API using `URLSession`.
- Decodes JSON into a Swift model (`PostDetails`).
- Displays posts inside a `UITableView`.
- Automatic cell height based on text content.
- Custom table cells with borders, title and body labels.
- **Architecture Evolution**:
  - ✅ **MVC**: Initial implementation where `ViewController` handled both UI and networking.  
  - ✅ **MVVM**: Refactored version with a `ViewModel` that separates business logic from UI.

---

## 📸 Screenshot
<img width="368" height="781" alt="image" src="https://github.com/user-attachments/assets/614b3697-bde4-41ef-b629-e6b8adda4615" />


---

## 🛠️ Tech Stack
- **Swift 5**
- **UIKit**
- **URLSession** for networking
- **JSONDecoder** for parsing API response
- **Auto Layout** for dynamic cell sizing
- **MVC → MVVM** refactor

---

## 📂 Project Structure
```
TableView-API/
├── Models/
│   └── PostDetails.swift      # Codable model for API response
├── Views/
│   └── PostTableCell.swift    # Custom UITableViewCell
├── ViewControllers/
│   └── ViewController.swift   # UI Layer (MVC)
├── ViewModels/
│   └── PostsViewModel.swift   # Refactored logic for MVVM
├── Network/
│   └── NetworkManager.swift   # Networking logic
└── Assets.xcassets
```

---

## 🔗 API Used
This project fetches data from:
```
https://jsonplaceholder.typicode.com/posts
```

Example response:
```json
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit suscipit recusandae..."
}
```

---

## ▶️ Running the App
1. Clone the repo:
```bash
git clone https://github.com/your-username/TableView-API.git
cd TableView-API
```
2. Open the project in Xcode.
3. Run on a simulator or device.

---

## 📖 How It Works
### MVC Phase
- `ViewController` directly calls `NetworkManager` to fetch posts.
- Data is assigned to `postsList` and displayed in the table.

### MVVM Phase
- Introduced `PostsViewModel` to fetch data and manage state.
- `ViewController` simply observes the `ViewModel`.
- Cleaner separation between business logic and UI code.

---

## 🚀 Future Improvements
- Add loading indicators while fetching data.
- Show error messages if the network call fails.
- Add pull-to-refresh functionality.
- Migrate to SwiftUI for a modern implementation.

---

## 👩‍💻 Author
**Dhathri Bathini**

Made with ❤️ in Swift.
