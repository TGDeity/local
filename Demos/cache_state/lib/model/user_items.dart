
import 'package:cache_state/model/user_model.dart';

class UserItems {
  //late final List<User> users;
  static List<User> users = [
    User(
      name: 'Tolga',
      description:
          'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      url: 'url/tolga2234',
    ),
    User(
      name: 'Ahmet',
      description:
          'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      url: 'url/ahmet',
    ),
    User(
      name: 'Ufuk',
      description:
          'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      url: 'urlufuk',
    ),
  ];
  UserItems();
}