enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  const Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  void printDetails(){
    print('Address: $street, city: $city, zipCode: $zipCode');
  }
  @override
  String toString () => '$street, $city, $zipCode'; 
}


class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;
  
  const Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._address,
    this._yearsOfExperience,
    );

  Employee.mobileDeveloper(
    this._name, this._baseSalary, this._address, this._yearsOfExperience,
  ) : _skills = [Skill.FLUTTER, Skill.DART];

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary () {
    double total = _baseSalary;

    total += _yearsOfExperience * 2000.0;

    for(final skill in skills) {
      switch(skill) {
        case Skill.FLUTTER: total += 5000.0;
        break;
        case Skill.DART: total += 3000.0;
        break;
        case Skill.OTHER: total += 1000.0;
        break;
      }
    }
    return total;
  }

  void printDetails() {
    print('Employee: $name, Base Salary: \$$_baseSalary, TotalSalary: \$${computeSalary()}');
    print('Address: $_address');
    print('Experience: $_yearsOfExperience years');
    print('Skills: ${_skills.map((s) => s.name).join(', ')}');
    print('-------------------------------------------');
  }
}

void main() {
  const address1 = Address('St. 2004', 'Phnom Penh', '12000');
  const address2 = Address('Russian Blvd', 'Phnom Penh', '12100');


  var emp1 = Employee('Sokea', 40000, [Skill.OTHER], address1, 2);
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper('Ronan', 45000, address2, 3);
  emp2.printDetails();
}