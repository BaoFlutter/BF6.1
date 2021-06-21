class UserInformation{
   String userName; 
   int birthYear; 
   String address; 
   String _phoneNumber; 
   int _bookPrice; 

   // public, private,. protected



   //UserInformation(); 
   UserInformation(String userName, int birthYear, String address)
   {
     this.userName = userName;
     this.birthYear = birthYear;
     this.address = address;
     
   }

    int tinhGiaSach(int soLuongSach){
      return soLuongSach* this._bookPrice * 3 ;
    }



   int tinhTuoi()
   {
     return 2021 - this.birthYear;
   }

   void printInformation()
   {
     print("Họ và tên: " + this.userName + "\n" 
     + "Tuổi:" + tinhTuoi().toString() + "\n" 
     + "Địa chỉ: " + this.address
     ) ;

   }
// getter 
    String getPhoneNumber()
   {
     return this._phoneNumber;
   }
// setter 
   String setPhoneNumber(String phoneNumber){
     this._phoneNumber = phoneNumber; 

   }


}