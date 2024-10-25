class Pizza {
  final String size;
  final bool hasCheese;
  final List<String> toppings;

  Pizza._builder(PizzaBuilder builder)
      : size = builder.size,
        hasCheese = builder.hasCheese,
        toppings = builder.toppings;

  @override
  String toString() {
    return 'Pizza(size: $size, cheese: $hasCheese, toppings: $toppings)';
  }
}

class PizzaBuilder {
  String size;
  bool hasCheese = false;
  List<String> toppings = [];

  PizzaBuilder(this.size);

  PizzaBuilder addCheese() {
    hasCheese = true;
    return this;
  }

  PizzaBuilder addTopping(String topping) {
    toppings.add(topping);
    return this;
  }

  Pizza build() {
    return Pizza._builder(this);
  }
}

void main() {
  // Creating a pizza with builder
  var pizza = PizzaBuilder("Large")
      .addCheese()
      .addTopping("Pepperoni")
      .addTopping("Mushrooms")
      .build();

  print(
      pizza); // Output: Pizza(size: Large, cheese: true, toppings: [Pepperoni, Mushrooms])

  // Creating another pizza without cheese
  var anotherPizza = PizzaBuilder("Medium").addTopping("Olives").build();

  print(
      anotherPizza); // Output: Pizza(size: Medium, cheese: false, toppings: [Olives])
}
