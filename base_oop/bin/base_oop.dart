import 'package:base_oop/base_oop.dart' as base_oop;

import 'user_information.dart';

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
  //printNumberWithSumUnder300(1000);
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

  UserInformation bao = UserInformation("Báo",1991, "Hà Nội"); 
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

}

// cho ra list số từ 1 đến 1000 chia hết cho 5 
List<int> getNumberList5(int n)
{
  List<int> resultList = []; 
  for(int i = 1; i<= n; i ++)
  {
    if(i%5 == 0) resultList.add(i);
  }

  return resultList;
}

// giai bai tap 
void printNumberWithSumUnder300(int n)
{
  int sum = 0 ;
  print("Các số có tổng không vượt quá 300: "); 
  for(int i = 1; i<=n ; i++)
  {
    sum += i; 
    if(sum <= 300) {
      print("$i");
      print("Tổng các số trên: $sum");
    }
    else {
      
      break;
    }
    
  }
  print("Chương trình kết thúc");
}
// vong For 
void inRaSoLe(int n)
{ 
   print("Các số lẻ từ 1 đến $n:") ;
   for(int i = n; i>0;  i--)
   {
     if(i%2 !=0 ) print ("$i");
   }

}
// vòng while

void inSoChanUseWhile(int n)
{  
  int start = 1; 
  print("Các số chẵn từ 1 đến $n:") ;
  while(start <= 10)
  {
    if(start%2 == 0 )
    {
     print("$start");
    } 
    if(start == 8 ) continue;  // break; continue; return ; 
    start ++;
  }

  print("Chương trình kết thúc");

}

// vòng do ... while 
void inSoChanUseDoWhile(int n)
{  
  int start = 1; 
  print("Các số chẵn từ 1 đến $n:") ;
  do
  {
    if(start%2 == 0 )
    {
     print("$start");
    } 
    start ++;
  }
  while(start <= 10);
  
  print("Chương trình kết thúc");

}



