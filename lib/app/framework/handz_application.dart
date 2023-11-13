import 'package:handz/helper/network/apiprovider/api_provider.dart';

import '../../helper/network/repository/api_repository.dart';
import 'application.dart';

class HandzApplication implements Application {
  APIRepository? apiRepository;

  @override
  Future<void> onCreate() async {
    initRepository();
  }

  @override
  Future<void> onTerminate() async {}

  void initRepository() {
    ApiProviders apiProvider = ApiProviders();
    apiRepository = APIRepository(apiProvider);
  }
}
