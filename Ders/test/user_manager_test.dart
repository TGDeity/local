import 'package:ders/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('user calculate ', () {
    final users = [
      GenericUser(name: 'tg', id: '10', money: 100),
      GenericUser(name: 'tg2', id: '11', money: 200),
      GenericUser(name: 'tg3', id: '12', money: 300),
    ];
    final result = UserManegement(AdminUser(1, name: 'TGA', id: '10', money: 101)).calculateMoney(users);

    expect(result, 101);
  });
}
