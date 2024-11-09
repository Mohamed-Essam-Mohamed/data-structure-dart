class UserProfile {
  String username;
  String email;
  Map<String, dynamic> preferences;

  UserProfile({
    required this.username,
    required this.email,
    required this.preferences,
  });

  // Clone method to create a copy of the UserProfile
  UserProfile clone() {
    // We deep-copy the preferences map to avoid shared references
    var clonedPreferences = Map<String, dynamic>.from(preferences);
    return UserProfile(
      username: username,
      email: email,
      preferences: clonedPreferences,
    );
  }

  @override
  String toString() {
    return 'UserProfile(username: $username, email: $email, preferences: $preferences)';
  }
}

// Example 2 :
class Product {
  String name;
  double price;

  Product(this.name, this.price);

  Product clone() {
    return Product(name, price);
  }

  void displayInfo() {
    print("Product: $name, Price: $price");
  }
}

void main() {
  // Original user profile
  var originalProfile = UserProfile(
    username: "Mohamed Esam",
    email: "Mohamed@gmail.com",
    preferences: {
      "theme": "dark",
      "notifications": true,
      "language": "Arabic",
    },
  );

  // Cloning the profile for a new user
  var clonedProfile = originalProfile.clone();

  // Customizing the cloned profile
  clonedProfile.username = "Esam Eid";
  clonedProfile.email = "Edam@gmail.com";
  clonedProfile.preferences["theme"] =
      "light"; // Changing theme for the new user

  // Output both profiles
  print("Original Profile: $originalProfile");
  print("Cloned Profile: $clonedProfile");
  // Example 2 :
  Product originalProduct = Product("Laptop", 1500.0);

  Product productCopy1 = originalProduct.clone();
  productCopy1.price = 1400.0;

  Product productCopy2 = originalProduct.clone();
  productCopy2.name = "Gaming Laptop";
  productCopy2.price = 2000.0;

  originalProduct.displayInfo(); // Product: Laptop, Price: 1500.0
  productCopy1.displayInfo(); // Product: Laptop, Price: 1400.0
  productCopy2.displayInfo(); // Product: Gaming Laptop, Price: 2000.0
}
