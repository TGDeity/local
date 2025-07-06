import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({super.key, required this.message});
  final String message; //Dışarıdan alınacak veri. StatefullLifeCycleLearn("Merhaba")

  @override
  State<StatefullLifeCycleLearn> createState() => _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  String _message = '';
  late final bool _isOdd;
  //Constructor anında değerini alacak dediğimiz için late eki eklenir. Daha ekran çizilmeden önce _isOdd değeri belli olacak. Final olduğu için zaten bir daha değer atanamayacak.

  @override
  void initState() {
    //Constructor metot gibi düşünülebilir. İnitState metodu bittikten sonra build metodu çağırılarak ekran çizilir.
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();

  }

  @override
  void didChangeDependencies() {
    //initState gibi çalışır ancak initStateden sonra calısır. (Drawingdan önce). Ancak bu tekrar tekarar çalışabilir önerilmiyor.??

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      // yukları sınıftaki StatefullLifeCycleLearn() bir değerde değişiklik olduğu zamann güncelleme buradan yakalanabilir.
      _message = widget.message;
      _computeName();
    }
  }

  @override
  void dispose() {
    // Sayfanın öldüğü anda çağrılır.
    super.dispose();
    _message = '';
  }

  void _computeName() {
    if (_isOdd) {
      _message += ' Çift';
    } else {
      _message += ' Tek';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: _isOdd ? Text(_message) : Text(_message)));
  }
}
