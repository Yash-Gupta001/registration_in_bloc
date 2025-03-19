import 'package:get/get.dart';
import 'package:rfc_cc/app/utils/config.dart';
import 'package:rfc_cc/app/utils/share_prefrance.dart';
import 'package:rfc_cc/data/network/api_provider.dart';
import 'package:rfc_cc/data/network/api_request.dart';
import 'package:rfc_cc/data/network/base_url.dart';
import 'package:rfc_cc/data/network/operation_callback.dart';

/*
  Created By Amol Gahukar 20-11-2024
*/
class APIService extends APIRequest {
  Map<String, String>? queryData;
  late HTTPMethod methodType;
  late String apiPath;
  Map<String, String>? headerData;
  late dynamic bodyData;
  late String contentTypeData;
  late OperationCallBack listenerCallback;
  final StorageService storageService = Get.find<StorageService>();

  APIService(
      {required this.queryData,
      required this.methodType,
      required this.apiPath,
      this.headerData,
      required this.contentTypeData,
      required this.bodyData,
      required this.listenerCallback});

  @override
  String? get contentType => contentTypeData;

  @override
  get body => bodyData;

  @override
  String get endpoint => BaseUrl.baseUrl;

  @override
  Map<String, String>? get headers => commonHeaders();
  @override
  HTTPMethod get method => methodType;

  @override
  String get path => apiPath;

  @override
  Map<String, String>? get query => queryData;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;

  Map<String, String> commonHeaders() {
    return {
      "token": storageService.getString(Config.TOKEN) ?? "",
      "uaType": storageService.getString(Config.UA_TYPE) ?? "",
      "id": storageService.getString(Config.UA_NO) ?? "",
      "idNo": storageService.getString(Config.IDNO) ?? "",
      "regNo": storageService.getString(Config.REG_NO) ?? "",
    };
  }

  @override
  OperationCallBack get listener => listenerCallback;
}
