// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_repo.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestClient implements RestClient {
  _RestClient(this._dio, this.warehouseApi, this.orderApi, this.authApi) {
    // baseUrl ??= 'https://api.izi-study.com';
  }

  final Dio _dio;

  String warehouseApi;
  String authApi;
  String orderApi;

  @override
  Future<ResponseData> signIn(Map<String, dynamic> body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.addAll({
      "domain": "test",
    });
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseData>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, ApiConstants.login,
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: authApi)));
    final value = ResponseData.fromJson(
      _result.data!,
      (json) {
        return json;
      },
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
