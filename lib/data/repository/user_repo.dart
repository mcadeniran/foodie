import 'package:get/get.dart';

import '../../data/api/api_client.dart';
import '../../utils/app_constants.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({
    required this.apiClient,
  });

  Future<Response> getUserInfo() async {
    // return await apiClient.get(AppConstants.USER_INFO_URI);
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}
