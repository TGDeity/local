// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ders/product/widget/button/answer_button.dart';
import 'package:ders/product/widget/button/loading_button.dart';
import 'package:ders/product/widget/callback_dropdown.dart';
import 'package:flutter/material.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropDown(onUserSelected: (CallBackUser user) {}),
          Answerbutton(
            onNumber: (number) {
              print(number);
              return number % 3 == 1;
            },
          ),
          LoadingButton(
            onPressed: () async {
             await Future.delayed(const Duration(seconds: 1), () {});
            },
            title: 'title',
          ),
        ],
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final int id;

  CallBackUser(this.name, this.id);

  @override
  bool operator ==(covariant CallBackUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}

class CallBackUsers {
  // TODO: Dummy Remove it
  static List<CallBackUser> dummyUsers() {
    return [CallBackUser('t', 123), CallBackUser('tg', 124), CallBackUser('t', 125)];
  }
}
