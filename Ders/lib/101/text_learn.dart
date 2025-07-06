import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({super.key, this.userName});
  final String name = 'tg';

  final String? userName;
  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BUY THE BEST ONE $name ${name.length}",
              style: ProjectStyles.welcomeStyle,
            ),
            Text(
              "BUY THE BEST ONE $name ${name.length}",
              style: ProjectStyles.welcomeStyle,
            ),
            Text(
              "BUY THE BEST ONE $name ${name.length}",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(color: ProjectColors.welcomeColor), // TEXT Widget'in en son gelmesi gereken nokta. Burası.
            ),
            Text(userName ?? ''),//null olabilecek değerleri nullsa boş değer döndür olarak kullanabiliriz.
            Text(keys.welcome) //Text('Merhaba') gibi bir ifade yerine bu keysleri de bir sınıfta topla.
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {

  static TextStyle welcomeStyle = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );
}

class ProjectColors {

  static Color welcomeColor = Colors.redAccent;
}
class ProjectKeys {
  final String welcome = "Merhaba";
}