class Inventory {
  void checkInventory(String item) {
    print("Checking inventory for $item...");
  }
}

class Payment {
  void processPayment(double amount) {
    print("Processing payment of \$$amount...");
  }
}

class Shipping {
  void arrangeShipping(String item) {
    print("Arranging shipping for $item...");
  }
}

class OrderFacade {
  final Inventory _inventory = Inventory();
  final Payment _payment = Payment();
  final Shipping _shipping = Shipping();

  void placeOrder(String item, double amount) {
    _inventory.checkInventory(item);
    _payment.processPayment(amount);
    _shipping.arrangeShipping(item);
    print("Order placed successfully for $item with amount \$$amount.");
  }
}

// void main() {
//   OrderFacade orderFacade = OrderFacade();

//   // Client places an order
//   orderFacade.placeOrder("Laptop", 1500.0);
// }

/// example 2 :
class UserFacade {
  final UserCacheService _cacheService = UserCacheService();
  final UserNetworkService _networkService = UserNetworkService();

  Future<String> getUserData() async {
    String data;

    data = await _cacheService.getCachedUserData();
    if (data.isNotEmpty) {
      return data;
    }

    data = await _networkService.fetchUserDataFromServer();

    _cacheService.cacheUserData(data);

    return data;
  }

  void saveUserData(String data) {
    _cacheService.cacheUserData(data);
  }
}

class UserNetworkService {
  Future<String> fetchUserDataFromServer() async {
    return Future.value("Name Data From Server");
  }
}

class UserCacheService {
  Future<String> getCachedUserData() async {
    return Future.value("Name Data From Cache");
  }

  void cacheUserData(String data) {}
}

void main() async {
  UserFacade userFacade = UserFacade();

  String userData = await userFacade.getUserData();

  userFacade.saveUserData(userData);
}
