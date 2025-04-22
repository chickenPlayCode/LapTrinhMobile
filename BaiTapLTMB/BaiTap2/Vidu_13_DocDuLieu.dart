import 'dart:io';
void main(){
  //nhạp tên người dùng
  stdout.write('Enter your name: ');
  String name = stdin.readLineSync()!;

  stdout.write('Enter your age: ');
  int age = int.parse(stdin.readLineSync()!);

  print ("Xin chao: $name, Tuổi của tôi là: $age");
}