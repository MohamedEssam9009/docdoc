import 'package:docdoc/core/helpers/extensions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final int? code;
  final String? message;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? errors;

  ApiErrorModel({
    this.code,
    this.message,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Returns strings containing all the error messages
  String getAllErrorsMessages() {
    if (errors.isNullOrEmpty()) return message ?? 'Unknown Error Occurred';
    final errorMessage = errors!.entries.map((entry) {
      final value = entry.value;
      return '${value.join(', ')}';
    }).join('\n');

    return errorMessage;
  }
}
