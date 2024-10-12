class Singleton {
  Singleton._();
  static Singleton? _instance;

  static Singleton get instance {
    _instance ??= Singleton._();
    return _instance!;
  }

  void showMessage() {
    print("Hello, I'm Singleton!");
  }
}
