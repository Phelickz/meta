import "package:injectable/injectable.dart";
import 'package:meta_trader/app/core/api/dio/dio_client.dart';
import "package:meta_trader/app/locator/locator.dart";
import "package:meta_trader/app/models/all_forex_news.dart";
import "package:meta_trader/app/models/trending_headlines.dart";
import "package:meta_trader/app/services/snackbar_service.dart";
import 'package:dio/dio.dart';

import "../core/api/forex.dart";

@lazySingleton
class ForexNewsService {
  static final dio = buildDioClient("https://forexnewsapi.com/api/v1");
  final token = 'mzmkknkewzgmkkiqvpdivwi5v7w6xkf1xdrcxncb';
  final ForexNewsClient forexNewsClient = ForexNewsClient(dio);
  final snackBar = locator<SnackBarService>();

  Future<AllForexNews?>? getAllForexNews(String section, int items, int page,
      {String? search}) async {
    try {
      return await forexNewsClient.getAllForexNews(
        section: section,
        items: items,
        page: page,
        token: token,
        search: search,
      );
    } on DioException catch (e) {
      snackBar.showSnackBar(e.message.toString());
      return null;
    } catch (e) {
      snackBar.showSnackBar(e.toString());
      return null;
    }
  }

  Future<TrendingHeadline?>? getAllTrendingHeadline(
    int items,
    int page,
  ) async {
    try {
      return await forexNewsClient.getAllTrendingHeadlines(
        items: items,
        page: page,
        token: token,
      );
    } on DioException catch (e) {
      snackBar.showSnackBar(e.message.toString());
      return null;
    } catch (e) {
      snackBar.showSnackBar(e.toString());
      return null;
    }
  }
}
