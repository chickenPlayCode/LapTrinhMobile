/*Future là gì?  
Hãy tưởng tượng bạn gọi món ăn tại một nhà hàng:  
* Bạn đặt món (gọi một hàm)  
* Nhân viên phục vụ nói "vâng, tôi sẽ mang món ăn đến sau" (nhận về một Future)  
* Bạn có thể làm việc khác trong lúc chờ đợi (tiếp tục chạy code)  
Khi món ăn được phục vụ (Future hoàn thành), bạn có thể thưởng thức nó (sử dụng kết quả)  

Future trong Dart cũng hoạt động tương tự.  
Đó là một cách để làm việc với các tác vụ  
mất thời gian mà không phải chờ đợi (ví dụ: tải liệu từ internet, đọc tệp).  

Hiểu rõ về "async/await"  
async và await là hai từ khóa đặc biệt trong Dart giúp làm việc với Future dễ dàng hơn.  

Từ khóa async:  
- Khi thêm từ khóa async vào một hàm,  
bạn đang nói với Dart: "Hàm này sẽ chứa code bất đồng bộ"  

- Một hàm được đánh dấu async sẽ luôn luôn trả  
về một Future (ngay cả khi bạn không khai báo nó)  

- Nếu bạn return một giá trị không phải Future từ một hàm async,  
Dart sẽ tự động đóng gói nó trong Future.  
*/

Future<String> LayTen() async{
  return "Nguyen Van A";
}
/**
 Từ khóa await  
- await chỉ có thể được sử dụng bên trong một hàm async  
Khi bạn đặt await trước một Future, Dart sẽ:  
- Tạm dừng thực thi hàm tại dòng đó  
- Đợi Future hoàn thành  
- Trả về giá trị từ Future (không còn đóng gói trong Future nữa)  
- Tiếp tục thực thi những dòng code còn lại  

await biến đổi Future<T> thành giá trị T, giúp code dễ đọc hơn  
 */

Future<String> TaiDuLieu() {
  return Future.delayed(
    Duration (seconds: 2),
    ()=> " Dữ liệu đã tải xong"
  );
}
 void HamChinh() async {
  print("bắt đầu tải dữ liêu ...");
  String KetQua = await TaiDuLieu();
  print( "Kết quả: $KetQua");
  print("Tiếp tục công việc khác");
 }

 // hàm chính 2
 void HamChinh2(){
  print("bắt đầi tải...");
  Future<String> KetQua = TaiDuLieu();
  print("kết quả: $KetQua");
  print("Tiếp tục công việc khác");
 }
 // hàm chính 3
 void HamChinh3(){
  print("bắt đầi tải...");
  Future<String> future = TaiDuLieu();
  future.then((KetQua){
    print("kết quả: $KetQua");
  });
print("Tiếp tục công việc khác trong khi đang tải");
 }
 //-----------------------------------------
 void main(){
  HamChinh3();
 }