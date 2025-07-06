import 'package:ders/303/generic_learn.dart';
import 'package:ders/product/widget/high_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:collection/collection.dart';

void main() {
  setUp(() {});

  test('List bes of', () {
    List<GenericUser> users = [
      GenericUser(name: 'tg', id: '11', money: 101),
      GenericUser(name: 'tg1', id: '12', money: 102),
      GenericUser(name: 'tg3', id: '13', money: 103),
    ];

    users.map((e) => HighCard(items: e.name.split(''))).toList();

    try {
      GenericUser object = users.singleWhere(
        (element) => element.findUserName('tg'),
        orElse: () => GenericUser(name: '', id: '', money: 0), //eğer bu durum olmazsa bunu döndddddddür
      ); //içinde tg olanı bul ve geriye döndür.
      print(object.money);
    } catch (e) {
      print(e);
    }

    print('${users.where((element) => element.money > 5)}');

    users.lastWhere((element) => element.id == '5');

    users.remove(GenericUser(name: 'tg1', id: '12', money: 102)); // TODOListeler referans tuttuğu için direkt remove imkanı bulunmuyor bu nedenle model sınıfında equtable kullanıyoruz. equtable sınıfına id leri eşitse eşittir dedik.

  });

  test('List best of with Collections', () {
    List<GenericUser> users = [
      GenericUser(name: 'tg', id: '11', money: 101),
      GenericUser(name: 'tg1', id: '12', money: 102),
      GenericUser(name: 'tg3', id: '13', money: 103),
    ];

    final response = users.singleWhereOrNull((element) => element.findUserName('x'));

    users.lastWhereOrNull((element) => element.id == '5');

    users.forEachIndexed((index, element) {}); //indexli foreach hem indexi hem elementi alabiliyoruz.
    users.expand((element) => [1, 2, 3]);
    print(response);
  });
}
