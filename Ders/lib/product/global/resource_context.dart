import 'package:ders/303/request_resource/model/resoruce_model.dart';


class ResourceContext {
  ResourceModel? model;

  void saveModel(ResourceModel? model) {
    this.model = model!;
    
  }

  void clear(){
    model = null;
  
  }
}
