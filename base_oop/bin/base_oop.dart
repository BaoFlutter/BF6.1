import 'package:base_oop/base_oop.dart' as base_oop;

import 'police.dart';
import 'user_information.dart';
import 'utils.dart';

void main(List<String> arguments) {
  /*
  for(int i= 1 ; i<= 5; i++)
  {
    print("Lần chạy thứ $i ") ;
    int value = i + 2 ; 
    print("$value");
  }
  */

  /*
  print("Các số lẻ từ 1 đến 10:") ;

  for(int i = 1; i<= 1000 ; i++)
  {
    if(i%2 !=0 ) print ("$i");
  }
  */
  //inRaSoLe(20);

  // While
  /*
  int count = 10; 
  while(count > 0){
    print("$count");
    count -- ;  // count = count - 1; count ++ ; count = count + 1; 
  }
  */
  //inSoChanUseWhile(10);
  //inSoChanUseDoWhile(10);
  int x; 
  print(x);


  printNumberWithSumUnder300(1000);
  List<int> list = [];
  List<int> list1 = [3, 5, 6];
  List<String> list2 = ["abc", "hello", "hi"];
  List list3 = List(); 

  //List list4 = [4, 5, "hello", "xy", true, false];
  /*
  List<int> numberList = [3, 4, 6, 18, 9, 5]; // 0,1,2,3,4,5
  for(int i = 0 ; i< numberList.length ; i++)
  {
    if(numberList[i]%3 == 0 ) print("Giá trị chia hết cho 3 có chỉ số $i là: " + numberList[i].toString());
  }

  for(int x in numberList){
    if(x%2 == 0 )
    print("Số chia hết cho 2 : $x ");
  }
  // 
  print("List số chia hết cho 5 không vượt quá 100");
  List<int> number5List = getNumberList5(100);
  print(number5List.toString());
  */

  UserInformation bao = UserInformation("Báo",1991, "Hà Nội",); 
  //print("Họ tên: "  + bao.userName);
  bao.userName = "Phạm Văn Báo";
  bao.setPhoneNumber("0349582808");
  print("Số điện thoại: " + bao.getPhoneNumber());
  bao.printInformation();

  //bao.getPhoneNumber();
 

  UserInformation bao1 = UserInformation("Báo 1",1991, "Hà Nội 1"); 
  UserInformation bao2 = UserInformation("Báo 2",1992, "Hà Nội 3"); 

  List<UserInformation> userList= [];
  userList.add(bao1);
  userList.add(bao2);

  for(UserInformation user in userList)
  {
    if(user.tinhTuoi() >= 30) print("User có tuổi không nhỏ hơn 30: " + user.userName);
  }

  // OOP 
  Police police = Police(); 
  police.userName = "Báo Flutter" ;
  police.birthYear = 1991; 
  int tuoi = police.tinhTuoi();


}




