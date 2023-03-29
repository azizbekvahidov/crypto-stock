import 'package:json_annotation/json_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseData<T> {
  T? object;
  bool? success;
  String? message;

  ResponseData({required this.object, this.message, required this.success});

  factory ResponseData.fromJson(
      Map<String, dynamic> json, T Function(dynamic? json) fromJsonT) {
    print(fromJsonT);
    return _$ResponseDataFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ResponseDataToJson(this, toJsonT);
}
