
import 'package:dart_try_catch/dart_try_catch.dart' as dart_try_catch;

void main(List<String> arguments) {
  var input = "5" ;

  try{
    int number = int.parse(input);
  }
  finally{
    print("Luôn luôn thực hiện");
  }
  print("Chương trình kết thúc");

  kiemTraTuoi(-10);

}

void kiemTraTuoi(int tuoi) {
if(tuoi<0) {
throw new FormatException("Tuổi không được âm");
}
else if (tuoi>60)
{
print ("Bạn đã già");
}
else print ("Bạn vẫn còn trẻ");
}
 
