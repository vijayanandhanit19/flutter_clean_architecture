import '../../../../core/services/api/api_client/api_client.dart';
import '../../../../core/setup/app_env_setup.dart';
import '../mock/home_mock_data.dart';
import '../models/home_data.dart';

abstract class HomeDatasource {
  Future<HomeData> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeDatasource {
  ApiClient client = ApiClient();
  final appEnvSetup = AppEnvSetup();

  @override
  Future<HomeData> getHomeData() async {
    // Uri uri = Uri.parse(
    //     'https://talentsphere-pte--ltd--development-workspace-tspmobile-srv.cfapps.ap11.hana.ondemand.com/mainservice/getBatchMaster');
    // final response = await client.get(uri);

    // var homeData = HomeData.fromJson(response);
    var homeData = HomeData.fromMap(homeMockData);

    return homeData;
  }
}
