class UserInformation{
   String userName; 
   int birthYear; 
   String address; 
   String _phoneNumber; 

   // public, private,. protected

   //UserInformation(); 
   UserInformation(String userName, int birthYear, String address)
   {
     this.userName = userName;
     this.birthYear = birthYear;
     this.address = address;
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