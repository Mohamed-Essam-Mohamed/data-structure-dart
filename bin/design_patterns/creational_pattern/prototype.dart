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
}
