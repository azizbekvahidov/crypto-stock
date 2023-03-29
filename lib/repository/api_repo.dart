import 'dart:convert';

import '../repository/models/models.dart';
import '../config/globals.dart' as globals;

import '../constants/api_constants.dart';
import './response_data.dart';
// import 'package:rus_tili/widget/horizontal_list_view_component.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

// import 'model/sign_up_model.dart';

part 'api_repo.g.dart';

// @RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @POST(ApiConstants.login)
  Future<ResponseData> signIn(@Body() Map<String, dynamic> body);
}
