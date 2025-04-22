/*
Records là một kiểu dữ liệu tổng hợp (composite type) được giới thiệu trong Dart 3.0 cho phép nhóm nhiều giá trị có kiểu khác nhau thành một đơn vị duy nhất.  
Records là immutable - nghĩa là không thể thay đổi sau khi được tạo.
*/
void main(){
  var r = ('first', 'x ', a:2, 5, 10.5); //record
  // định nghũa record có hai giá trị 
  var point = (123,456);

  // định dạng peson

  var peson = (name:'Alice', age: 25,5);

  // truy cập giá trị của crecord

  // dùng chỉ số
  print( point.$1);//123
  print(point.$2);//456 

  print(peson.name);
  print(peson.age);
  print(peson.$1);


}