// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reterofit.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  });

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<HomePageResponse> getHomePageResponse() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HomePageResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/f/f/b56850fc-47bd-492c-a3da-2e8a8c5ddd0b/cfa60c8b-5c47-415e-a8a8-457eed3190ff/home_page.json?table=block&id=11f3d626-2aa2-806c-8c0e-debca77c7929&spaceId=b56850fc-47bd-492c-a3da-2e8a8c5ddd0b&expirationTimestamp=1730131200000&signature=2mPsSibnDwy_FT9jDCKKGfN9Nwa49fPUYvT7F35vxtk&downloadName=home_page.json',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late HomePageResponse _value;
    try {
      _value = HomePageResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<TestmonialResponse> getTestmonialResponse() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<TestmonialResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/f/f/b56850fc-47bd-492c-a3da-2e8a8c5ddd0b/846b7db1-ffc4-4fb8-be96-879d160f228b/testimonials.json?table=block&id=11f3d626-2aa2-80f5-90b2-fb2a5cb3cda8&spaceId=b56850fc-47bd-492c-a3da-2e8a8c5ddd0b&expirationTimestamp=1730174400000&signature=AHTtb939MuELwEtUy6wB8RVy2ZlQtC0BhlJqNfP-WDs&downloadName=testimonials.json',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late TestmonialResponse _value;
    try {
      _value = TestmonialResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
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

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
