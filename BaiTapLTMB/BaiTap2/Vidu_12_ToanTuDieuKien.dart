void main() {
  var KiemTra = (100 % 2 == 0) ? "100 là số chẵn" : "100 là số lẻ";
  print(KiemTra);

  var x = 100;
  var y = x ?? 50;
  print (y);

  int? z;
  y= z ?? 30;
  print (y);
}