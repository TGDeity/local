import 'package:ders/303/mobx_image_picker/view/mobx_image_upload_view.dart';

import 'package:flutter/material.dart';

class NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home') {
      _navigateToNormal(const MobxImageUpload());
    }
    return null;
  }

  Route<dynamic>? _navigateToNormal(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }
}
