import 'person.dart';

class Police extends Person{
  
  @override
  String getJob() {
    // TODO: implement getJob
    return super.getJob();
    print("Bảo vệ an ninh");
  }



}

abstract class PersonNo{

  String getInfor();

}