import 'package:json_annotation/json_annotation.dart';

part 'chuck_norris_model.g.dart';

@JsonSerializable()
class ChuckNorris {
  List? categories;
  @JsonKey(name : 'created_at')
  String? createdAt;
  @JsonKey(name : 'icon_url')
  String? iconUrl;
  String? id;
  @JsonKey(name : 'updated_at')
  String? updatedAt;
  String? url;
  String? value;

  ChuckNorris({
    this.categories,
    this.createdAt,
    this.iconUrl,
    this.id,
    this.updatedAt,
    this.url,
    this.value,
  });


  factory ChuckNorris.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$ChuckNorrisFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$ChuckNorrisToJson(
    this,
  );
}
