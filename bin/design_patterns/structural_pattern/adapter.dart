import 'dart:convert';

class Employee {
  String name;
  double salary;
  Employee(this.name, this.salary);
}

class MachineOperator {
  String name;
  double basicSalary;
  String shiftCode;
  MachineOperator(this.name, this.basicSalary, this.shiftCode);
}

class SalaryCalculator {
  double calculateSalary(Employee employee) => employee.salary * 1.5;
}

void main() {
  Employee employee = Employee('Ahmed', 2000);
  MachineOperator machineOperator = MachineOperator('Mohammad', 2000, '1');
  SalaryCalculator salaryCalculator = SalaryCalculator();
  salaryCalculator.calculateSalary(employee); // 2000 * 1.5 = 3000

  AdapterSalaryCalculator adapterSalaryCalculator = AdapterSalaryCalculator();
  adapterSalaryCalculator
      .calculateSalaryAdapter(machineOperator); // 3000 * 1.5 = 4500
  // salaryCalculator.calculateSalary(machineOperator);  // Error because MachineOperator doesn't have salary
}

class AdapterSalaryCalculator extends SalaryCalculator {
  Employee? _employee;
  double calculateSalaryAdapter(MachineOperator machineOperator) {
    _employee = Employee(machineOperator.name, machineOperator.basicSalary);
    return super.calculateSalary(_employee!);
  }
}
// example 2 :

// //? data json
// class JsonContactsApi {
//   static const _contactsJson = '''
//   {
//     "contacts": [
//       {
//         "fullName": "John Doe (JSON)",
//         "email": "johndoe@json.com",
//         "favourite": true
//       },
//       {
//         "fullName": "Emma Doe (JSON)",
//         "email": "emmadoe@json.com",
//         "favourite": false
//       },
//       {
//         "fullName": "Michael Roe (JSON)",
//         "email": "michaelroe@json.com",
//         "favourite": false
//       }
//     ]
//   }
//   ''';

//   const JsonContactsApi();

//   String getContactsJson() => _contactsJson;
// }

// //? data xml
// class XmlContactsApi {
//   static const _contactsXml = '''
//   <?xml version="1.0"?>
//   <contacts>
//     <contact>
//       <fullname>John Doe (XML)</fullname>
//       <email>johndoe@xml.com</email>
//       <favourite>false</favourite>
//     </contact>
//     <contact>
//       <fullname>Emma Doe (XML)</fullname>
//       <email>emmadoe@xml.com</email>
//       <favourite>true</favourite>
//     </contact>
//     <contact>
//       <fullname>Michael Roe (XML)</fullname>
//       <email>michaelroe@xml.com</email>
//       <favourite>true</favourite>
//     </contact>
//   </contacts>
//   ''';

//   const XmlContactsApi();

//   String getContactsXml() => _contactsXml;
// }

// class Contact {
//   final String fullName;
//   final String email;
//   final bool favorite;

//   const Contact({
//     required this.fullName,
//     required this.email,
//     required this.favorite,
//   });
// }

// abstract interface class IContactsAdapter {
//   List<Contact> getContacts();
// }

// class JsonContactsAdapter implements IContactsAdapter {
//   const JsonContactsAdapter({
//     this.api = const JsonContactsApi(),
//   });

//   final JsonContactsApi api;

//   @override
//   List<Contact> getContacts() {
//     final contactsJson = api.getContactsJson();
//     final contactsList = _parseContactsJson(contactsJson);

//     return contactsList;
//   }

//   List<Contact> _parseContactsJson(String contactsJson) {
//     final contactsMap = json.decode(contactsJson) as Map<String, dynamic>;
//     final contactsJsonList = contactsMap['contacts'] as List;
//     final contactsList = contactsJsonList.map((json) {
//       final contactJson = json as Map<String, dynamic>;

//       return Contact(
//         fullName: contactJson['fullName'] as String,
//         email: contactJson['email'] as String,
//         favorite: contactJson['favourite'] as bool,
//       );
//     }).toList();

//     return contactsList;
//   }
// }

// class XmlContactsAdapter implements IContactsAdapter {
//   const XmlContactsAdapter({
//     this.api = const XmlContactsApi(),
//   });

//   final XmlContactsApi api;

//   @override
//   List<Contact> getContacts() {
//     final contactsXml = api.getContactsXml();
//     final contactsList = _parseContactsXml(contactsXml);

//     return contactsList;
//   }

//   List<Contact> _parseContactsXml(String contactsXml) {
//     final xmlDocument = XmlDocument.parse(contactsXml);
//     final contactsList = <Contact>[];

//     for (final xmlElement in xmlDocument.findAllElements('contact')) {
//       final fullName = xmlElement.findElements('fullname').single.innerText;
//       final email = xmlElement.findElements('email').single.innerText;
//       final favouriteString =
//           xmlElement.findElements('favourite').single.innerText;
//       final favourite = favouriteString.toLowerCase() == 'true';

//       contactsList.add(
//         Contact(
//           fullName: fullName,
//           email: email,
//           favorite: favourite,
//         ),
//       );
//     }

//     return contactsList;
//   }
// }
