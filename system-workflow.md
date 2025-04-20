# 📘 Online Bookstore Management System - Workflow

## 1. User Flow
### a. Registration
- User visits the registration page.
- Enters name, email, password, and phone.
- The system stores user data securely (hashed password).

### b. Login
- User logs in with email and password.
- System verifies credentials and grants access based on role.

### c. Browsing Books
- Users (customers or admins) can view a list of available books.
- Each book shows title, author, price, stock, and genre.

### d. Purchasing Books
- Customers can select books and add them to a "cart" (or buy directly).
- System checks stock availability.
- If available, an order is created in `Orders` and details stored in `OrderDetails`.
- Stock is decreased accordingly.

## 2. Admin Flow
### a. Book Management
- Admins can add, update, or delete books from the catalog.
- Can manage book stock levels and prices.

### b. Order Management
- Admins can view all orders placed by customers.
- See order totals and item details.

## 3. Rules & Validations
- Book stock cannot go below 0.
- Passwords are stored securely using hashing.
- Users must be logged in to purchase.
- Admins only can manage inventory.
