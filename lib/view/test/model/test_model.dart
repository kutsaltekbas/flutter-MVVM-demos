import 'package:json_annotation/json_annotation.dart';
import 'package:parolla_game_mvvm/core/base/model/base_model.dart';

part 'test_model.g.dart';
@JsonSerializable()

class TestModel extends BaseModel{
 final int userId;
 final int id;
 final String title;
 final bool completed;

  TestModel(this.userId, this.id, this.title, this.completed);
  
  @override
  fromJson(Map<String, dynamic> json) {
    return _$TestModelFromJson(json);


  }
  
  @override
  Map<String, dynamic> toJson() {
    return _$TestModelToJson(this);

  }

  
}