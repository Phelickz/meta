import 'package:dio/dio.dart';
import 'package:meta_trader/app/models/all_forex_news.dart';
import 'package:meta_trader/app/models/trending_headlines.dart';
import 'package:retrofit/retrofit.dart';

part 'forex.g.dart';

@RestApi(baseUrl: 'https://forexnewsapi.com/api/v1')
abstract class ForexNewsClient {
  factory ForexNewsClient(Dio dio, {String baseUrl}) = _ForexNewsClient;

  @GET('/category')
  Future<AllForexNews> getAllForexNews({
    @Query('section') required String section,
    @Query('items') required int items,
    @Query('page') required int page,
    @Query('token') required String token,
    @Query('search') String? search,
  });

  @GET('/trending-headlines')
  Future<TrendingHeadline> getAllTrendingHeadlines({
    @Query('items') required int items,
    @Query('page') required int page,
    @Query('token') required String token,
  });

  // @GET('/')
  // Future<TrendingHeadline> getAllTrendingHe({
  //   @Query('currencypair') required int items,
  //   @Query('items') required int items,
  //   @Query('page') required int page,
  //   @Query('token') required String token,
  // });

  // https://forexnewsapi.com/api/v1?currencypair=EUR-USD,GBP-USD,AUD-USD&items=3&page=1&token=mzmkknkewzgmkkiqvpdivwi5v7w6xkf1xdrcxncb

  // https://forexnewsapi.com/api/v1/trending-headlines?page=1&token=mzmkknkewzgmkkiqvpdivwi5v7w6xkf1xdrcxncb

  // https://forexnewsapi.com/api/v1/category?section=general&items=3&page=1&search=Federal+Reserve&token=mzmkknkewzgmkkiqvpdivwi5v7w6xkf1xdrcxncb

  // https://forexnewsapi.com/api/v1/category?section=general&items=3&page=1&search=Federal+Reserve&token=mzmkknkewzgmkkiqvpdivwi5v7w6xkf1xdrcxncb

  // https://forexnewsapi.com/api/v1/category?section=allcurrencypairs&items=3&page=1&token=mzmkknkewzgmkkiqvpdivwi5v7w6xkf1xdrcxncb
}
