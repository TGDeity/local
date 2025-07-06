import 'package:ders/202/model_learn.dart';
import 'package:flutter/material.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
   PostModel8 user9 = PostModel8(body: 'a');

  @override
  void initState() {
    super.initState();

    final user1 = PostModel1()
      ..userId = 1
      ..body = 'tv';
    user1.body = 'hello';

    final user2 = PostModel2(1, 2, 'b', 'a')
      ..userId = 1
      ..body = 'tv';
    user2.body = 'hello';

    final user3 = PostModel3(1, 2, 'a', 'b');
    //user3.body = 'a'; PostModel3 //de body değeri class içersinde final olduğu için değiştirtilemez.

    final user4 = PostModel4(body: 'a', id: 1, title: 'b', userId: 2);
    //user4.body = 'a';

    final user5 = PostModel5(userId: 1, id: 2, title: 'b', body: 'a');
    print(user5.userId); //Burada erişilen değer get metodundan geliyor. Benim yazdığım kural ile :=)

    final user6 = PostModel6(userId: 1, id: 2, title: 'b', body: 'a');

    final user7 = PostModel7(); //default değerler calısıyor.

    final user8 = PostModel8(body: 'a');
    //Önerilen Yol. PostModel 8 Eğer PostModel localde oluşmuyorsa interneten beslencekse, local için ise model 4 ve ilerisi
    //Tavksiye edilen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          user9 = user9.copyWith(body: '2aa'); //copyWith metodu var olan sınıfı değiştirmeden üzerinde update yaptırıyor.
          user9.updateBody(null);
        });

      }),
      appBar: AppBar(title: Text(user9.title ?? 'Not have any data')),
    );
  }
}
