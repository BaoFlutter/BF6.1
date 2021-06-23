class UserInformation{

  // private, public 

  // Các thuộc tính : Các biến 
  int? id; 
  String? userName; 
  int? birthYear; 
  String? _phoneNumber; 
  int _money = 2000000000;
 

  // Các phương thức : Hàm 

  // Hàm khởi tạo ,  Hàm constructor
  //UserInformation();  : Hàm khởi tạo mặc định
  
  /*
  UserInformation({int? id, String? userName, int? birthYear, String? phoneNumber})
  {
    this.id = id; 
    this.userName = userName;
    this.birthYear = birthYear;
    this.phoneNumber = phoneNumber;
  }
  */
  /*
   String getPhoneNumber()
   {
     return this._phoneNumber!;
   }
   */
 /*
  String get phoneNumber {
    return this._phoneNumber! ;
  }
  */

  UserInformation({this.id, this.userName, this.birthYear}); 

  String get phoneNumber => this._phoneNumber!;

  /*
  => a;  =====  { return a;} 
  */

  void setPhoneNumber({ required String phoneNumber })
  {
    this._phoneNumber = phoneNumber;
  }
  
  int tinhTuoi()
  {
    return 2021 - this.birthYear!;
  }

  void inRaSoTuoi()
  {
    int age = tinhTuoi();
  }

  int tinhSoTienConLai( int? tongChi)
  {
    return this._money - tongChi! - 5;
  }


}