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
