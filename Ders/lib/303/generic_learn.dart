// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserManegement<T extends AdminUser> {
  final T adminUser;

  UserManegement(this.adminUser);

  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var element in users) {
      sum += element.money;
    }

    final sumMoney = users.map((e) => e.money).fold<int>(0, (previousValue, element) => previousValue + element);
    print(sumMoney);
    return sum;
  }
}

class GenericUser  extends Equatable{
  final String name;
  final String id;
  final int money;

  const GenericUser({required this.name, required this.id, required this.money});

  bool findUserName(name){
    return this.name == name;
  }

  @override
  String toString() => 'GenericUser(name: $name, id: $id, money: $money)';
  
  @override
  // TODO: equtable
  List<Object?> get props => [id]; //id ler eşitse eşittir.
}

class AdminUser extends GenericUser {
  final int role;
  const AdminUser(this.role, {required super.name, required super.id, required super.money});
}
