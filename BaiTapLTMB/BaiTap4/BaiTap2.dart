import 'dart:io';
// Hàm tính tổng hai số nguyên
int calculateSum(int num1, int num2) {
  return num1 + num2;
}
void main() {
  // Nhập hai số nguyên từ bàn phím
  print("Nhập số nguyên thứ nhất: ");
  int num1 = int.parse(stdin.readLineSync()!);
  
  print("Nhập số nguyên thứ hai: ");
  int num2 = int.parse(stdin.readLineSync()!);
  
  // Gọi hàm calculateSum và in kết quả
  int result = calculateSum(num1, num2);
  print("Tổng của $num1 và $num2 là: $result");
}


