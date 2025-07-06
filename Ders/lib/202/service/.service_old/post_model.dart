class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});

// Modeldeki bu yapıya kod yazma. Bir şeye ihtiyacın varsa bu model dosyasında yeni func oluştur.
//fromJson gelen datayı parse eder.
  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
// Modeldeki bu yapıya kod yazma.
//toJson Servse Json türünde data gönderir.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
