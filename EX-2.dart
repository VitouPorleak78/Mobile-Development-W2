class BankAccount {
    // TODO
    final int _accountId;
    final String _accountOwner;
    double _balance;

    BankAccount({
      required int accountId,
      required String accountOwner,
      double initialBalance = 0.0,
    }) : _accountId = accountId,
         _accountOwner = accountOwner,
         _balance = initialBalance;

  int get accountId => _accountId;
  String get accountOwner => _accountOwner;
  double get balance => _balance;

void credit(double amount) {
  if (amount <= 0) {
    throw Exception('Credit amount must be positive!');
  }
  _balance += amount;
}

void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Withdrawal amount must be positive!');
    }
    if (_balance - amount < 0) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }
}

class Bank {
    // TODO
  final String _name;
  final List<BankAccount> _accounts = [];

  Bank({required String name}) : _name = name;

  String get name => _name;
  List<BankAccount> get accounts => List.unmodifiable(_accounts);

  // Q4: createAccount method
  BankAccount createAccount(int accountId, String accountOwner) {
    // Check if account ID is unique
    final exists = _accounts.any((acc) => acc.accountId == accountId);
    if (exists) {
      throw Exception('Account with ID $accountId already exists!');
    }

    // Create new account, add to list, and return
    final newAccount = BankAccount(
      accountId: accountId,
      accountOwner: accountOwner,
    );
    _accounts.add(newAccount);
    return newAccount;
  }
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
     print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
  print(e); // Output: Account with ID 100 already exists!
  }
}
