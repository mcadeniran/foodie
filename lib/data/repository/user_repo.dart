import 'package:get/get.dart';

import 'package:foodie/data/api/api_client.dart';
import 'package:foodie/utils/app_constants.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({
    required this.apiClient,
  });

  Future<Response> getUserInfo() async {
    return await apiClient.get(AppConstants.USER_INFO_URI);
  }
}
