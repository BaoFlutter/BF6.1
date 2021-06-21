
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