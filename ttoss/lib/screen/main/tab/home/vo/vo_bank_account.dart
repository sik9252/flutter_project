import 'vo_bank.dart';

class BankAccount {
  final Bank bank;
  int balance; // 잔액은 계속 변하니까 final X
  final String? accountTypeName;

  BankAccount(this.bank, this.balance,
      {this.accountTypeName}); // 중괄호 넣으면 있어도 되고 없어도 되는 optional 파라미터
}
