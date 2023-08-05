import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/chuck_norris_model.dart';
part 'chuck_norris_web_services.g.dart';


@RestApi(baseUrl: 'https://api.chucknorris.io/jokes/')
abstract class ChuckNorrisWebServices {

  factory ChuckNorrisWebServices(Dio dio, {String baseUrl}) = _ChuckNorrisWebServices;

  @GET('random')
  Future<ChuckNorris> getJoke();

}