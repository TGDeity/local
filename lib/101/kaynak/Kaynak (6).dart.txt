import 'package:flutter/material.dart';

class ButtonLearnView extends StatelessWidget {
  const ButtonLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button')),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,children: 
          [
          TextButton(onPressed: () {}, 
          style: ProjectButtonStyle.textButtonStyle,
          child:  Text('Text Button',style: ProjectTextStyle.textStyle(context))),
          ElevatedButton(style: ButtonStyleFormSinifi.roundedRectangleBorder,onPressed: () {}, child: const Text('Elevated Button')),
           SizedBox(
            width: 70,
            height: 70,
            child: OutlinedButton(style: ButtonStyleFormSinifi.style,

                    
              onPressed: () {}, child:  Text('Outlined Button')),
          ),
          IconButton(iconSize: 50,onPressed: () {}, icon: const Icon(Icons.roundabout_left_outlined)),
          FloatingActionButton(onPressed: () {
            //servise istek at,
            //rengi düzenle vs..

          }),
          InkWell(
          onTap: () =>print('InkWellCustomButton'),
          autofocus: true,
          focusColor: Colors.red,
          hoverColor: Colors.green,

          child: const Text('CustomButtonX'),
          ),
          
        ],
        ),
      )
      
    );
  }
}


// Borders:
// CircleBorder(), RoundedRectangleBorder(), BeveledRectangleBorder(), StadiumBorder()
// 

class ButtonStyleFormSinifi {

static ButtonStyle get  style => OutlinedButton.styleFrom(side: const BorderSide(color: Colors.red,), shape: ButtonStyleFormSinifi.shape);
static CircleBorder get shape => CircleBorder();
static  get roundedRectangleBorder =>  ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ); 
}

class ProjectTextStyle {
  static TextStyle? textStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;
}




class ProjectButtonStyle {

static get textButtonStyle => ButtonStyle(backgroundColor: WidgetStateProperty.resolveWith((states) {
            if(states.contains(WidgetState.pressed)){
              return Colors.green;
            }
            return Colors.white;
          }));


}

