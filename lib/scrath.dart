void main() {

  String myString = 'abc';

  try {
    double myDouble = double.parse(myString);
  }
  catch (e) {
    print(e);
  }

  //myDouble += 5 ;

  //print(myDouble);


}
