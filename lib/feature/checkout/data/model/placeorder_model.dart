class SubmitOrder {
  final String name;
  final String governorateId;
  final String phone;
  final String address;
  final String email;

  SubmitOrder({
    required this.name,
    required this.governorateId,
    required this.phone,
    required this.address,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['governorate_id'] = governorateId;
    data['phone'] = phone;
    data['address'] = address;
    data['email'] = email;
    return data;
  }
}
