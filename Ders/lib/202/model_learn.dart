// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers


class PostModel1 {
  int? userId;
  int? id;
  String? title;
  String? body;
}

class PostModel2 {
  int userId;
  int id;
  String title;
  String body;

  PostModel2(this.userId, this.id, this.title, this.body);

  // Now, initialize
}

class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);

  // Now, initialize
}

class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId, required this.id, required this.title, required this.body});

  // Now, initialize
}

class PostModel5 {
  //Tavksiye edilen
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  PostModel5({required int userId, required int id, required String title, required String body})
    : _userId = userId,
      _id = id,
      _title = title,
      _body = body;

  int get userId => _userId;
  int get id => _id;
  String get title => _title;
  String get body => _body;

  // {
  //   int _userId = userId;
  //   int _id = id;
  //   String _title = title;
  //   String _body = body;
  // }

  // Now, initialize
}

class PostModel6 {
  //Tavksiye edilen
  late final int _userId; //late final değeri sadece const anında gelecek anlamına gelir.
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({required int userId, required int id, required String title, required String body}) {
    int _userId = userId;
    int _id = id;
    String _title = title;
    String _body = body;
  }
}

class PostModel7 {
  //Tavksiye edilen
  late final int _userId; //late final değeri sadece const anında gelecek anlamına gelir.
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7({int userId = 0, int id = 0, String title = '', String body = ''}) {
    int _userId = userId;
    int _id = id;
    String _title = title;
    String _body = body;
  }
}

class PostModel8 {
  //Önerilen Yol. Eğer PostModel localde oluşmuyorsa interneten beslencekse
  //Tavksiye edilen
  final int? userId; //late final değeri sadece const anında gelecek anlamına gelir.
  final int? id;
  final String? title;
  /*final*/ String? body;

  PostModel8({this.userId, this.id, this.title, this.body});

  void updateBody(String? data) {

    if(data !=null && data.isNotEmpty){
      body = data;
    }

  }

  /*
metodu, immutable (değiştirilemez) nesneleri kolayca kopyalayıp belirli alanlarını değiştirmek için kullanılan bir desendir (pattern). Flutter'da ve özellikle state yönetiminde sıkça kullanılır.

Mevcut nesnenin bir kopyasını oluşturur

Sadece belirtilen alanları değiştirir

Diğer alanları olduğu gibi korur

Immutable Nesneler: Flutter'da widget'lar ve state nesneleri genellikle immutable'dır. copyWith bu nesneleri değiştirmenin güvenli yoludur.

Performance: Tüm nesneyi yeniden oluşturmak yerine sadece değişen kısımları günceller.

Okunabilirlik: Kodun amacını daha net gösterir.

Null Safety: Null değerlerle güvenli şekilde çalışmayı sağlar (?? operatörü sayesinde).
*/




  PostModel8 copyWith({int? userId, int? id, String? title, String? body}) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
