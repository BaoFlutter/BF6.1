import 'package:oop_dart/oop_dart.dart' as oop_dart;
import 'package:test/scaffolding.dart';

import 'user_information.dart';
import 'xe.dart';
import 'xe_bus.dart';

void main(List<String> arguments) {
  // Dart SDK < 2.12 : nullable 
  //int x; //OK  
  // Dart SDK >= 2.12 : nonnullable 
  /*
  int? x; 
  int y = x?? 0 +1;
  print(y.toString());
  */

  UserInformation baoFlutter1 = UserInformation(id: 1, userName: "Báo Flutter", birthYear: 1991) ;//
  baoFlutter1.setPhoneNumber(phoneNumber: "0349582808");
  print(baoFlutter1.userName);
  print(baoFlutter1.phoneNumber);

  UserInformation baoFlutter2 = UserInformation(id: 2, userName: "Báo", birthYear: 2001) ;//

   UserInformation viet = UserInformation(id: 3, userName: "viet", birthYear: 1990) ;//

  List<UserInformation> userList = []; 
  userList.add(baoFlutter1);
  userList.add(baoFlutter2);
  userList.add(viet);

  UserInformation? maxAgeUser ;
  int maxAge = 0; 
  for(dynamic user in userList )
  {
    if(user.tinhTuoi() > maxAge)
    {
      maxAge = user.tinhTuoi();
      maxAgeUser = user; 
    }
    //maxAge = (user.tinhTuoi() > maxAge) ? user.tinhTuoi() : maxAge; 
  
  }

  print("Người có tuổi lớn nhât là:" + maxAgeUser!.userName!);

  // Các tính đối tương
  

  XeBus  xeBus = XeBus(brand: "TN", name: "109", age: 2010);
  print(xeBus.brand);
  xeBus.chuyenCho();
  
}

tinhTong(int? a , int? b)
{
  int x = a ?? 0 + 1; 
return a! + b!;
}
