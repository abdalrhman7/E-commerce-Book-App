class MyOrderModel {
  int? id;
  String? orderCode;
  String? orderDate;
  String? status;
  String? total;

  MyOrderModel(
      {this.id, this.orderCode, this.orderDate, this.status, this.total});

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderCode = json['order_code'];
    orderDate = json['order_date'];
    status = json['status'];
    total = json['total'];
  }


}