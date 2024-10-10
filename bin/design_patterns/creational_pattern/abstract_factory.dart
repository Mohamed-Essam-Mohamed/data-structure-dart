enum ProductElectronicsType { mobile, laptop }

abstract class ProductElectronics {
  ProductElectronics();
  factory ProductElectronics.create(ProductElectronicsType type) {
    switch (type) {
      case ProductElectronicsType.mobile:
        return ProductMobile();
      case ProductElectronicsType.laptop:
        return ProductLaptop();
    }
  }
  void show();
}

class ProductMobile extends ProductElectronics {
  @override
  void show() {}
}

class ProductLaptop extends ProductElectronics {
  @override
  void show() {}
}

enum ProductBeautyType { skincare, makeup }

abstract class ProductBeauty {
  ProductBeauty();
  factory ProductBeauty.create(ProductBeautyType type) {
    switch (type) {
      case ProductBeautyType.skincare:
        return ProductSkincare();
      case ProductBeautyType.makeup:
        return ProductMakeup();
    }
  }
  void show();
}

class ProductSkincare extends ProductBeauty {
  @override
  void show() {}
}

class ProductMakeup extends ProductBeauty {
  @override
  void show() {}
}

abstract class AbstractFactory {
  AbstractFactory();
  ProductElectronics createElectronics(ProductElectronicsType type);
  ProductBeauty createBeauty(ProductBeautyType type);
}

class ConcreteFactory extends AbstractFactory {
  @override
  ProductElectronics createElectronics(ProductElectronicsType type) {
    return ProductElectronics.create(type);
  }

  @override
  ProductBeauty createBeauty(ProductBeautyType type) {
    return ProductBeauty.create(type);
  }
}

void main() {
  AbstractFactory factory = ConcreteFactory();
  ProductElectronics mobile =
      factory.createElectronics(ProductElectronicsType.mobile);
  mobile.show();
  ProductBeauty makeup = factory.createBeauty(ProductBeautyType.makeup);
  makeup.show();
}
