import 'package:foodie/data/repository/user_repo.dart';
import 'package:foodie/models/response_model.dart';
import 'package:foodie/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({
    required this.userRepo,
  });

  bool _isLoading = false;
  late UserModel _userModel;

  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    // print("test " + response.body.toString());

    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      print(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "Successful");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }
}