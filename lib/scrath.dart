import 'dart:io';


void task1(){
  String result = "Fin funcion 1";
  print (result);
}

Future task2() async{
  Duration threeseconds = Duration(seconds: 3);
  String result;
  await Future.delayed(threeseconds , (){
    result = "Fin funcion 2";
    print (result);
  });
  return result;
}

void task3(String data){
  String result = "Fin funcion 3 , con datos: $data";
  print (result);
}

void ejecutaTareas()async{
  task1();
  String data = await task2();
  task3(data);
}


void main() {
  ejecutaTareas();
}