import 'package:base_dart/base_dart.dart' as base_dart;

int a = 6; 

void main(List<String> arguments) {
  String startString = "Flutter" ;
  int number = 10; 
  int x = 10; 
  int y = 5; 
  double mathPoint = 8.5;
  bool isLogined = true; 
  const String API_KEY = "KNGHng8904Ughr";

  DateTime now = DateTime.now();
  print(now.toString());

  int z = tinhTong(x, y);
  print("Tổng của 2 số là : " + z.toString());

  printMessage();

  int n = 5; 
  int soBinhPhuong = tinhBinhPhuong(n);
  print("Giá trị bình phương của $n : " + soBinhPhuong.toString());

  // Giải bài 5
  double a = 10.0 ; 
  double dienTich = tinhDienTichHinhVuong(a);
  double chuVi = tinhChuViHinhVuong(a);
  print("Diện tích hình vuông có cạnh $a là : " + dienTich.toString() );
  print("DChu vi hình vuông có cạnh $a là : " + chuVi.toString() );

  testChucNang(); 
  printSoDu(2,9);

  // Toán tử gán : x += y; <=> x = x + y; 
  
  int i = 5; 
   i -= 3; 
   i = i - 3; // i = 2; 
   i *= 2; // i = 4; 
  //i += 1; // i = i + 1; 
  //i -= 2; // i = i - 2; 
  //i += 1; // i = i + 1; 
  print("Giá trị toán tử gán: $i ");

  bool value = 4 <= 5; // true 
  value = 6 < 3; // false 
  value = value && (x > y); // false
  // && : true = 1; false = 0 ; && <=> * ; true && true = true ; true && false = false; false && false = 0 ; 
  print("Giá trị : " + value.toString());
  // || : true = 1; false = 0 ; || <=> + ; true || true = true ; true || false = true; false || false = false; 
  bool value2 = true; 
  value = value || value2; // true; 

  bool value3 = x == y; // false 
  value3 = x != y; // true

  if(value3) print("Giá trị value3 là : true");
  else  print("Giá trị value3 là : false");

  double point = 9.5; 
  danhGiaHocLuc(point);

  print("Giá trị : " + value.toString());



printKetLuanChiaHetCho2(x); 
printKetLuanChiaHetCho2(y); 

 kiemTraChanLe(10);


}

// tìm số nhỏ nhất và lớn nhất trong 3 số 
void timSoLonNhatVaNhoNhat(int x, int y, int z)
{
  int min = x; 
  int max = y ; 

  if(x >= y)
  {
    min = y; 
    max = x; 
    if(x>=z)
    {
    max = x; 
    if(y>= z)
    {
      min = z;
    }
    }
  }
  else {
    max = y; 
    min = x; 

    if(y>= z)
    {
      max = z; 
    }
    if(x>= z)
    {
      min = z;
    }
  }

  print("Giá trị lớn nhất: $max");
  print("Giá trị nhỏ nhất: $min");



}


// lấy số du 
int printSoDu(int soChia, int soBiChia)
{
  int soDu = soBiChia%soChia;
  print("Số dư"+ soDu.toString());

} 

void printKetLuanChiaHetCho2( int n)
{
  if(n % 2 == 0) print("Số $n chia hết cho 2");
  else print("Số $n không chia hết cho 2");

}

void danhGiaHocLuc(double diem)
{
  if((diem<0)||(diem>10)) 
  {
  print ("Diem Khong hop le");
  return; 
  }
  if(diem < 5) print("Hoc luc Yeu");
  else if( diem < 6.5) print("Hoc luc trung binh");
  else if(diem <8.5) print ("Học Khá");
  else if (diem >= 8.5) print ("Học Giỏi");

 


}

//switch.. case 

void kiemTraChanLe(int n)
{
  switch(n%2)
  {
    case 0:
    print("Số chẵn");
    break;
    //return; 

    case 1:
    print("Số lẻ");
    break;

    default:
    print("Số không xác định");
   
  }

  print("Kiểm tra kết thúc");
}

int tinhTong( int a, int b)
{
  int c = a + b; 
  return c;

}

void testChucNang(){
   
   printMessage();
   //return; 
   int x = 5;
   int sum = tinhTong(x, x) + a;
   print("Tổng là : $sum");

}

void printMessage()
{
  print("Say Hello !");
  return; 
}

int tinhBinhPhuong(int n)
{
  int binhPhuong = n * n; 
  return binhPhuong;

}

// tính chu vi 
double tinhChuViHinhVuong(double canh){
  return 4 * canh; 
}

/*
Tính diện tích 
của hình vuông 
*/

double tinhDienTichHinhVuong(double canh)
{
  return canh * canh; 
}


