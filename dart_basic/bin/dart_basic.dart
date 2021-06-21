import 'package:dart_basic/dart_basic.dart' as dart_basic;


int globalVar = 6; 
void main(List<String> arguments) {

  int a ; 
  a = 10; 
  a = 30; 
  String name = "Báo Flutter" ;
  double doubleNumber = 8.5;
  bool booleanVariable = true; 
 

  DateTime now = DateTime.now();
  print(now.toString());

  var b = 2; 
  var d = 8.5;
  
  dynamic c = 3;
  c = "hihi" ;

  var string = "String" ;
  var boolVariable = false;


  dynamic time = DateTime.now() ;
  var time2 = DateTime.now();

  // khac nhau 1

  var varNumber = 7; 
  //varNumber = 8.5;

  final dynamic dynamicNumber = 7; 
  //dynamicNumber = 8.5;

  List list = [1, false, "hello", 8.5, DateTime.now()];

  int m = 5; 
  int n = 6; 
  int sum = tinhTong(m, n);
  print("Tổng hai số là : $sum");
  print("Tổng hai số là : " + sum.toString());

  int soDu = n%m ;  // n : m lấy duư

  print("Số dư: $soDu")  ;
  checkChanLe(m);
  checkChanLe(5);
  m+=n ; // m = m + n;
  print("Giá trị $m"); // m = 11; n = 6;

  bool result = m > n; //true
  print(result.toString());
  result = m <= n; // false 
  result = m >= n; // true 
  result = m != n; // true
  result = m == n; // fale
  // && ; ||
  // && = * ; true = 1; false = 0 ;  true && false = false; false && true = false; true && true = true; false && false = false; 
  // || = + ; true = 1; false = 0 ; true || false = true; false || true = true; true || true = true; false || false = false ; 

  print(((5>6)&&(7>3)).toString());//false 
  //inRaSoChanLeSuDungIfElseAndFor(20);
  inRaSoChanLeSuDungIfElseAndWhile(20);
  checkChanLeSwitchCase(8);

  List<String> saidString = ["hello", "hihi" ];
  List<dynamic> dynamicList = [1, 8.5, "Hello", true];
  List tempList = List(); 
  List<int> numberList = [2, 4,5,6, 9,8];  // length = 6; chỉ số : 0, 1, 2, 3,4,5
  kiemTraCacSoChiaHetCho3TrongList(numberList);

// key: value ; //
/* 
{
"so1" : 5,
"so2" : 6; 
}

*/

Map<dynamic, dynamic> baoInformation = {
 "name" : "Báo Flutter",
 "age" : 30,
 3 : 8.6
};

Map baoInformation2 = {
 "name" : "Báo Flutter",
 "age" : 30,
 3 : 8.6
};
print("Tên : " + baoInformation["name"]);
print("Số 3 : " + baoInformation[3].toString());

}
// toán tử gán 
/*
x+=y; <=>  x = x + y; 
x-=y ; <=> x = x -y; 
x*=y ; <=> x = x* y; 
x%=y ; <=> x = x% y; 

*/
int tinhTong(int x, int y)
{
  return x + y; 
}

void checkChanLe(int n){
  if(n%2 == 0) print("Số $n là số chẵn") ;
  else print("Số $n là số lẻ") ;
}


/*
Bài tập : In ra các số chẵn nhỏ hơn 20
*/

void inRaSoChanLeSuDungIfElseAndFor(int n){
// i ++ ; i = i +1; i-- ; i = i -1
 for (int i = 1; i<= n ; i++)
 {
   if(i%2 == 0) { 
    // if(i==14) continue;
     
     print("$i");
    // if(i==10) break;
    //if(i==10) return;
     
      }
    
    
 }

print("Hàm kết thúc !") ;

}

void inRaSoChanLeSuDungIfElseAndWhile(int n){
// i ++ ; i = i +1; i-- ; i = i -1
 int count = 1; 
 /*
 while(count < n)
 {
   if(count%2 == 0 ) print("$count");
   count++; 

 }
 */

 do
 {
   if(count%2 == 0 ) print("$count");
   count++; 

 }
 while(count < n);
 

print("Hàm kết thúc !") ;

}

void checkChanLeSwitchCase(int number)
{
  switch(number%2)
  {
    case 0:
    print("Số $number là số chẵn");
    break; 

    case 1: 
    print("Số $number là số lẻ");
    break;

    default: 
    print("Số nhập vào không xac đinh");

  }

}

void kiemTraCacSoChiaHetCho3TrongList(List<int> list)
{
 print("Chiều dài của List là : " + list.length.toString() + "\n") ;
 print("Các số chia hết cho 3 trong list");
 /*
for(int i = 0 ; i < list.length ; i++)
{
  if(list[i] % 3 == 0) print(list[i].toString());

}
*/

for(int value in list)
{
  if(value%3 == 0 ) print("$value");
}

}