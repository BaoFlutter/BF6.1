import 'dart:developer';

import 'package:async_dart/async_dart.dart' as async_dart;

void main(List<String> arguments) async  {
  
  //var number =  await makeLateNumber();
  makeLateNumber().then((value){
    print(value.toString());
  });

 // print(number);

 Stream<int> numberStream = Stream<int>.periodic(
   Duration(seconds:2),
   makeNumber,
 );

 /*

 numberStream.listen((number) {
   print("Số trong Stream: $number");

  });

  */
/*
  await for (int number in numberStream )
  {
print("Number : $number");
  }
  */
  
  var stream = countStream(12);
  stream.listen((number) {
   print("Số trong Stream: $number");

  });

  print("Chương trình kết thúc");

}

Stream<int> countStream(int max) async*
{
  for(int i = 1; i<= max ; i++)
  {
    yield i;
  }
}


Future<int> makeLateNumber(){
  return Future.delayed(
    Duration(seconds: 2),
    (){
      return 3;
    }

  );



}

 int makeNumber(int value) => (value +1) ;

