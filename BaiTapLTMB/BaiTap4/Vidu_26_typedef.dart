/* tipedef trong dart là một cách ngắn ngọn để tạo các alias(bí danh)


*/
//import 'dart:typed_data';

import 'dart:async';
import 'dart:ffi';

typedef IntList= List<int>;
typedef ListMapper<X> = Map<X, List<X>>;
typedef DoubleList = List<double>;  

void main(){
  IntList l1 = [1,2,3,4,5];
  print(l1);

  IntList l2 = [1,2,3,4,5,6,7];

  Map<String, List<String>> m1 ={}; // lhas dài
  ListMapper<String> m2 ={};// ,1 và ,2 là cùng 1 kiểu

  DoubleList l3 = [1.0, 3.0]; // Sử dụng double với chữ số thập phân  
  print(l3);  


}