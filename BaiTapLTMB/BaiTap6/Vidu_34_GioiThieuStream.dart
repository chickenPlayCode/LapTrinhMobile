/**
 Dưới đây là văn bản đã được trích xuất từ hình ảnh:

```
Stream là gì?
Nếu Future giống như đợi một món ăn, thì Stream giống như xem một kênh YouTube:
 Bạn đang ký kênh (lắng nghe stream)
  Video mới liên tục được đăng tải (stream phát ra dữ liệu)
   Bạn xem từng video khi nó xuất hiện (xử lý dữ liệu từ stream)
 Kênh có thể đăng tải nhiều video theo thời gian (stream phát nhiều giá trị)

Stream trong Dart là chuỗi các sự kiện hoặc dữ liệu theo thời gian, không chỉ một lần.
```

 */
import 'dart:async';
void ViDuStream(){
  Stream<int> stream =Stream.periodic(Duration(seconds: 1), (x)=>x+1).take(5);
  // lắng nghe stream 
  stream.listen(
(so)=> print("nhan dược số: $so"),
onDone: ()=> print("stream đã hoàn thành"),
onError: (loi)=> print("có lỗi: $loi"),
  );
}
void main(){
  ViDuStream();
}