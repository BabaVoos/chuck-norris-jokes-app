import '../models/chuck_norris_model.dart';
import '../web_services/chuck_norris_web_services.dart';

class ChuckNorrisRepo {
  final ChuckNorrisWebServices chuckNorrisWebServices;

  ChuckNorrisRepo(this.chuckNorrisWebServices,);

  Future<ChuckNorris> getJokes() async{
    return await chuckNorrisWebServices.getJoke();
  }

}