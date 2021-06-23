

import 'dart:convert';

import 'xe.dart';
class XeBus extends Xe{

XeBus({ required brand, required name, required age}) : super(brand: brand, name: name, age: age);
 
void printBrand(){
  print(super.brand);
}

tinhTuoi(){
  return 2021 - super.age! ; 
}

@override
  chuyenCho() {
    // TODO: implement chuyenCho
    print("Chuyên chở người");
  }

}