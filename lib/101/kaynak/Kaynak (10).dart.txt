import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  //ContainerSizedBoxLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(width: 100, height: 100, child: Text('*' * 100)),
          SizedBox.shrink(), //boş bir alan.
          SizedBox.square(
            dimension: 50,
            child: Text('b' * 50),
          ), //kare oluştur.
          Container(
            //Containerin SizedBox'tan farkı içerisinde ekstra bir sürü özellik var.
            //width: 50,
            //height: 200,
            //color: Colors.red, // decoration kullanıyorsak color burada gösterilemez.
            constraints: const BoxConstraints(
              maxHeight: 100,
              minWidth: 10,
              minHeight: 10,
              maxWidth: 100,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtilty.boxDecorationGet,
            child: Center(child: Text('as' * 5,maxLines: 3,)),
          ),
        ],
      ),
    );
  }
}


class ProjectUtilty {
  static BoxDecoration decoration =BoxDecoration(
              //color: Colors.red,
              gradient: const LinearGradient(colors: [Colors.red, Colors.green]),
              borderRadius:  BorderRadius.circular(100),
              //shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.green, blurRadius: 10,offset: Offset(20,15)), BoxShadow(color: Colors.white, blurRadius: 20)],
              border: Border.all(
                width: 10,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            ); //constrains'i kullanarak bölümleme yapabiliriz, bu durumda kaydırma olmaz. Örneğin Text içerisindeki metne göre büyüme oluyor.

static get boxDecorationGet => BoxDecoration( // get yapısı ile hotRealoadda görünmesi için keyfi yaptık.
              //color: Colors.red,
              gradient: const LinearGradient(colors: [Colors.red, Colors.green]),
              borderRadius:  BorderRadius.circular(100),
              //shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.red, blurRadius: 10,offset: Offset(20,15)), BoxShadow(color: Colors.white, blurRadius: 20)],
              border: Border.all(
                width: 10,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            );

}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration (): super (

  
              //color: Colors.red,
              gradient: const LinearGradient(colors: [Colors.red, Colors.green]),
              borderRadius:  BorderRadius.circular(500),
              //shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10,offset: Offset(20,15)), BoxShadow(color: Colors.white, blurRadius: 20)],
              border: Border.all(
                width: 10,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
             //constrains'i kullanarak bölümleme yapabiliriz, bu durumda kaydırma olmaz. Örneğin Text içerisindeki metne göre büyüme oluyor.

  );
}