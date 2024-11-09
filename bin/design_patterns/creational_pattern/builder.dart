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
/// example 2
// class CustomAlertDialogBuilder {
//   String? title;
//   String? content;
//   String? positiveButtonText;
//   String? negativeButtonText;
//   VoidCallback? onPositivePressed;
//   VoidCallback? onNegativePressed;

//   CustomAlertDialogBuilder setTitle(String title) {
//     this.title = title;
//     return this;
//   }

//   CustomAlertDialogBuilder setContent(String content) {
//     this.content = content;
//     return this;
//   }

//   CustomAlertDialogBuilder setPositiveButtonText(String text) {
//     positiveButtonText = text;
//     return this;
//   }

//   CustomAlertDialogBuilder setNegativeButtonText(String text) {
//     negativeButtonText = text;
//     return this;
//   }

//   CustomAlertDialogBuilder setOnPositivePressed(VoidCallback onPressed) {
//    onPositivePressed = onPressed;
//     return this;
//   }

//   CustomAlertDialogBuilder setOnNegativePressed(VoidCallback onPressed) {
//     onNegativePressed = onPressed;
//     return this;
//   }

//   AlertDialog build() {
//     return AlertDialog(
//       title: Text(title ?? 'تنبيه'),
//       content: Text(content ?? 'هناك خطأ ما'),
//       actions: [
//         if (negativeButtonText != null)
//           TextButton(
//             onPressed: onNegativePressed,
//             child: Text(negativeButtonText!),
//           ),
//         if (positiveButtonText != null)
//           TextButton(
//             onPressed: onPositivePressed,
//             child: Text(positiveButtonText!),
//           ),
//       ],
//     );
//   }
// }

// void showCustomDialog(BuildContext context) {
//   final dialog = CustomAlertDialogBuilder()
//       .setTitle('خطأ في الاتصال')
//       .setContent('يرجى التحقق من اتصال الإنترنت وإعادة المحاولة.')
//       .setPositiveButtonText('موافق')
//       .setOnPositivePressed(() {
//         Navigator.of(context).pop();
//       })
//       .setNegativeButtonText('إلغاء')
//       .setOnNegativePressed(() {
//         Navigator.of(context).pop();
//       })
//       .build();

//   showDialog(
//     context: context,
//     builder: (BuildContext context) => dialog,
//   );
// }
