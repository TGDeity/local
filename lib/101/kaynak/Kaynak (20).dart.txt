import 'package:flutter/material.dart';

class  StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});

  @override
  Widget build(BuildContext context) {
    final String text = "TG";
    return Scaffold(
      appBar: AppBar(title: const Text("StatelessLearn")),
      body: Column(
        children: [
          TitleTextWidget(text: text),
          _emptBox(),
          TitleTextWidget(text: text),
          _emptBox(),
          TitleTextWidget(text: text),
          _emptBox(),
          TitleTextWidget(text: text),
          _CustomContainer(),//Çok kompleks olduğu düşünülen yapılar widget olarak ayrıştırılmalıdır. ctrl + . extract widget ile kısa yoldan.
          _emptBox()
        ],
      ),
    );
  }

  SizedBox _emptBox() => SizedBox(height: 10); // basit compenentleri fonksiyonlarla da oluşturabiliriz.
  
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.black12),
      
    );
  }
}

class TitleTextWidget extends StatelessWidget {
const TitleTextWidget({super.key, required this.text});
  
 final String text;

  @override
  Widget build(BuildContext context) {
    return  Text(text,style: Theme.of(context).textTheme.displaySmall);
  }
}