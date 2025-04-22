void main() {
  // Các phép tính cơ bản
  int a = 5 + 3;
  int b = 10 - 4;
  int c = 3 * 4;
  double d = 10 / 2;
  int e = 7 % 3; // 1

  print('a = $a, b = $b, c = $c, e = $e'); // ✅ In ra màn hình
  print('d = $d');

  // Phép chia lấy phần nguyên
  int f = 7 ~/ 2;
  print('f = $f');

  // Phép gán và tính toán kết hợp
  int x = 10;
  x += 5;
  x -= 2;
  x ~/= 3;
  print('x = $x'); // ✅ In ra kết quả

  // Tăng/Giảm
  int y = 100;
  y++;
  y--;
  print('y = $y'); // ✅ In ra kết quả
}