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

void main() {
  OrderFacade orderFacade = OrderFacade();

  // Client places an order
  orderFacade.placeOrder("Laptop", 1500.0);
}
