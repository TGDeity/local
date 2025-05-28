import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});
  final String _title = 'Title Merhaba';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Icon(Icons.chevron_left),
        leadingWidth: 10,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light ,
        automaticallyImplyLeading: false,// sayfada otomatik olarak back butonu gelmesin.
        //actionsIconTheme: IconThemeData(color: Colors.amber, size: 24),
    
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.mark_email_unread_sharp),
          ),
          const Center(child: CircularProgressIndicator())
        ],),
      body: Column(),
    );
  }
}
