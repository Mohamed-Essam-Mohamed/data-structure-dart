enum ProductType {
  mobile,
  laptop,
  tv,
}

abstract class ProductElectronics {
  String name;
  int price;
  String color;

  ProductElectronics({
    required this.name,
    required this.price,
    required this.color,
  });
  //? factory method
  factory ProductElectronics.create(ProductType type) {
    switch (type) {
      case ProductType.mobile:
        return ProductMobile(
          name: "Apple",
          price: 1000,
          color: "black",
        );
      case ProductType.laptop:
        return ProductLaptop(
          name: "Dell",
          price: 1000,
          color: "black",
        );
      case ProductType.tv:
        return ProductTV(
          name: "Sony",
          price: 1000,
          color: "black",
        );
    }
  }
  void show();
}

class ProductMobile extends ProductElectronics {
  ProductMobile({
    required super.name,
    required super.price,
    required super.color,
  });

  @override
  void show() {
    print("name: $name, price: $price, color: $color");
  }
}

class ProductLaptop extends ProductElectronics {
  ProductLaptop({
    required super.name,
    required super.price,
    required super.color,
  });

  @override
  void show() {
    print("name: $name, price: $price, color: $color");
  }
}

class ProductTV extends ProductElectronics {
  ProductTV({
    required super.name,
    required super.price,
    required super.color,
  });

  @override
  void show() {
    print("name: $name, price: $price, color: $color");
  }
}

void main() {
  ProductElectronics mobile = ProductElectronics.create(ProductType.mobile);
  mobile.show();

  ProductElectronics laptop = ProductElectronics.create(ProductType.laptop);
  laptop.show();

  ProductElectronics tv = ProductElectronics.create(ProductType.tv);
  tv.show();
}

/// example 2 :
enum AlertType { success, error }

abstract class Alert {
  void showAlert();
  factory Alert.createAlert(AlertType type) {
    switch (type) {
      case AlertType.success:
        return SuccessAlert();
      case AlertType.error:
        return ErrorAlert();
    }
  }
}

class SuccessAlert implements Alert {
  @override
  void showAlert() => print("Success Alert");
}

class ErrorAlert implements Alert {
  @override
  void showAlert() => print("Error Alert");
}
