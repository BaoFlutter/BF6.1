import 'package:nullsafety_ex/nullsafety_ex.dart' as nullsafety_ex;

void main(List<String> arguments) {
 // <2.12 : nullable 
 // >= 2.12 : nonnullable ; => NullSafety

 int? number ; 
 //int sum = number! + number! ;
 tinhTong(soHang1: 5, soHang2: 6);

 checkChanLe();
}


tinhTong({int? soHang1, int? soHang2})
{
int sum = soHang1! + soHang2!; 
return sum ; 
}

checkChanLe([int? a])
{
print("something");
}


