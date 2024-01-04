import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 =
BankAccount(bankShinhan, 3000000, accountTypeName: '신한 주거래 우대통장(저축예금)');
final bankAccountShinhan2 =
BankAccount(bankShinhan, 1234546, accountTypeName: '저축예금');
final bankAccountShinhan3 =
BankAccount(bankShinhan, 8888888888, accountTypeName: '저축예금');
final bankAccountKakao =
BankAccount(bankShinhan, 30000000);
final bankAccountTtoss =
BankAccount(bankShinhan, 1999999, accountTypeName: '입출금통장');

main() {
  print(bankAccounts[0].accountTypeName);
}

final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao,
  bankAccountTtoss
];

// Map -> 데이터 가져올때 사용
final bankMap = {
  "shinhan1": bankAccountShinhan1,
  "shinhan2": bankAccountShinhan2,
};

// Set -> 데이터가 존재하는지 여부 판단시에 자주 사용
final bankSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao,
  bankAccountTtoss
};